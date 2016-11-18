class ActivationCode < ApplicationRecord
  belongs_to :license
  belongs_to :teacher
  belongs_to :user

  def expired
    @expired ||= self.expires_on.past?
  end

  def activate(user_id)
    unless self.activated
      activating_user = User.find(user_id)
      self.activated = true
      self.activated_on = DateTime.now
      self.expires_on = self.activated_on + 1.year
      self.user = activating_user
      self.save
      if self.teacher_id
        self.teacher.students << self.user unless self.teacher.students.include?(self.user)
      end
      if self.app_type != activating_user.app_type
        activating_user.update(app_type: self.app_type)
      end
    end
  end

  def deactivate
    if self.activated
      self.activated = false
      self.activated_on = nil
      self.user = nil
      self.save
    end
  end

end
