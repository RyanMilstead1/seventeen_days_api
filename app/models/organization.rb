class Organization < ApplicationRecord
  has_many :licenses
  has_many :activation_codes
  has_many :organization_admins
  has_many :organization_teachers
  has_many :admins, class_name: "User", through: :organization_admins, foreign_key: 'admin_id'
  has_many :teachers, class_name: "User", through: :organization_teachers, foreign_key: 'teacher_id'
  has_many :surveys
  has_many :questions

end
