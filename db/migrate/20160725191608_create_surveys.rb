class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :position
      t.belongs_to :organization, index: true
      
      t.timestamps
    end
  end
end
