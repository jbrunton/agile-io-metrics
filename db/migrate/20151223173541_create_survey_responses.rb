class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :survey_instance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
