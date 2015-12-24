class RenameSurveyToSurveyTemplate < ActiveRecord::Migration
  def change
    rename_table :surveys, :survey_templates
    rename_column :survey_questions, :survey_id, :survey_template_id
    rename_column :survey_instances, :survey_id, :survey_template_id
  end
end
