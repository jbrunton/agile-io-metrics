json.array!(@survey_instances) do |survey_instance|
  json.extract! survey_instance, :id, :name, :survey_id
  json.url survey_instance_url(survey_instance, format: :json)
end
