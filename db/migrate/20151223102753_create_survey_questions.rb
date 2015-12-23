class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.text :text
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
