class User < ActiveRecord::Base
  before_create :set_default_role
  has_one :organization_admin, foreign_key: :admin_id
  has_one :organization, through: :organization_admin
  has_many :activation_codes
  has_many :survey_assignments
  has_many :surveys, through: :survey_assignments

  validates :role, presence: true

  validates :app_type,
    :inclusion  => { :in => [ 'eat_smart', 'your_move', 'seventeen_days' ],
    :message    => "%{value} is not a app type" }

  devise :database_authenticatable, :recoverable,
         :trackable, :validatable, :registerable,
         :omniauthable

  def reset_and_remove_legacy_password_flag(new_password)
    self.password = self.password_confirmation = new_password
    self.legacy_password = false
    self.save
  end

  self.inheritance_column = :role

  include DeviseTokenAuth::Concerns::User


  def active_survey_ids
    actives = []
    activated_date = activated_on
    self.survey_assignments.each do |assignment|
      if !assignment.complete && check_show_date(activated_date, assignment.survey.days_until_show)
        actives << assignment.survey_id
      end
    end
    actives
  end

  def as_json
    super(include: { activation_codes: { methods: :expired }, surveys: { include: {questions: { include: { answers: {} } } } } }, methods: :active_survey_ids)
  end

  private
  def set_default_role
    self.role ||= "Student"
  end

  def check_show_date(activated_date, survey_date)
    if survey_date
      current_date = DateTime.now
      show_date = activated_date + survey_date.days
      current_date > show_date
    else
      true
    end
  end

  def activated_on
    result = nil
    self.activation_codes.each do |ac|
      result = ac.activated_on if ac.activated && !ac.expired
    end
    result
  end
end
