class AddDaysUntilShowToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :days_until_show, :integer
  end
end
