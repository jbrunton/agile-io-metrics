json.array!(survey_templates) do |survey_template|
  json.extract! survey_template, :id, :name, :description, :organization_id
  json.url survey_url(survey_template, format: :json)
end
