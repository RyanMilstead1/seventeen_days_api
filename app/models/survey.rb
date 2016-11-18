class Survey < ApplicationRecord
  belongs_to :organization
  has_many :survey_assignments
  has_many :survey_questions
  has_many :users, through: :survey_assignments
  has_many :questions, through: :survey_questions
end
