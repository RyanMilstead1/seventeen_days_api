class AddVideoTrackingToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_file, :string
    add_column :users, :current_file_time, :int, default: 0
  end
end
