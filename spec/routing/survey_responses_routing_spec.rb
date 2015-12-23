require "rails_helper"

RSpec.describe SurveyResponsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survey_instances/1/survey_responses").to route_to("survey_responses#index", :survey_instance_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/survey_instances/1/survey_responses/new").to route_to("survey_responses#new", :survey_instance_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/survey_instances/1/survey_responses").to route_to("survey_responses#create", :survey_instance_id => "1")
    end

  end
end
