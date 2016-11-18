class CreateSurveyAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_assignments do |t|
      t.belongs_to :survey
      t.belongs_to :user

      t.timestamps
    end
  end
end
