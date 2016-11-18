class AddCountToLicenses < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :count, :integer
  end
end
