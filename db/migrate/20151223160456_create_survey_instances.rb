class CreateSurveyInstances < ActiveRecord::Migration
  def change
    create_table :survey_instances do |t|
      t.string :name
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
