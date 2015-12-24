class RenameSurveyInstanceToSurvey < ActiveRecord::Migration
  def change
    rename_table :survey_instances, :surveys
    rename_column :survey_responses, :survey_instance_id, :survey_id
  end
end
