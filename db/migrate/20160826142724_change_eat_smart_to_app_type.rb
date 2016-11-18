class ChangeEatSmartToAppType < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :eat_smart, :boolean
    add_column :users, :app_type, :string, default: 'seventeen_days'
  end
end
