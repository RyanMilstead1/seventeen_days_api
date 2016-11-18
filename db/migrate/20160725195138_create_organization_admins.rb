class CreateOrganizationAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_admins do |t|
      t.belongs_to :admin, index: true
      t.belongs_to :organization, index: true
      
      t.timestamps
    end
  end
end
