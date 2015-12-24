require "rails_helper"

RSpec.describe SurveyResponsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/surveys/1/survey_responses").to route_to("survey_responses#index", :survey_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/surveys/1/survey_responses/new").to route_to("survey_responses#new", :survey_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/surveys/1/survey_responses").to route_to("survey_responses#create", :survey_id => "1")
    end

  end
end
