class UpdateUserPositionDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :position, :string, default: 'openpreview'
  end
end
