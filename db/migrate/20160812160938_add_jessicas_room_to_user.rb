class AddJessicasRoomToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :jessicas_room, :boolean, default: false
  end
end
