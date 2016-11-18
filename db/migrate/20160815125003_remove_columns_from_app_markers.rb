class RemoveColumnsFromAppMarkers < ActiveRecord::Migration[5.0]
  def change
    remove_column :app_markers, :page_name, :string
    remove_column :app_markers, :save_type, :string
  end
end
