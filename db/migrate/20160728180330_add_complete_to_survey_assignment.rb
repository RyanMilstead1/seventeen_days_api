class AddCompleteToSurveyAssignment < ActiveRecord::Migration[5.0]
  def change
    add_column :survey_assignments, :complete, :boolean, default: false
  end
end
