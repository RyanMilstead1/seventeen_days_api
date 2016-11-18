class OrganizationAdmin < ApplicationRecord
  belongs_to :organization
  belongs_to :admin, class_name: "User"
end
