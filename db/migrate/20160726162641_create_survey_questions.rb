class CreateSurveyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_questions do |t|
      t.belongs_to :survey, index: true
      t.belongs_to :question, index: true
      
      t.timestamps
    end
  end
end
