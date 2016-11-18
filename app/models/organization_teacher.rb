class OrganizationTeacher < ApplicationRecord
  belongs_to :organization
  belongs_to :teacher, class_name: "User"
end
