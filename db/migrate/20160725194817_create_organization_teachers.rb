class CreateOrganizationTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_teachers do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :teacher, index: true

      t.timestamps
    end
  end
end
