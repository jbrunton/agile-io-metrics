require "rails_helper"

RSpec.describe SurveyQuestionsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/survey_templates/1/survey_questions").to route_to("survey_questions#create", :survey_template_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey_questions/1").to route_to("survey_questions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey_questions/1").to route_to("survey_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey_questions/1").to route_to("survey_questions#destroy", :id => "1")
    end

  end
end
