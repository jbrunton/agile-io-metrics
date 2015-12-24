require "rails_helper"

RSpec.describe SurveyTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/organizations/1/survey_templates").to route_to("survey_templates#index", :organization_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/organizations/1/survey_templates/new").to route_to("survey_templates#new", :organization_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/survey_templates/1").to route_to("survey_templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survey_templates/1/edit").to route_to("survey_templates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/organizations/1/survey_templates").to route_to("survey_templates#create", :organization_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey_templates/1").to route_to("survey_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey_templates/1").to route_to("survey_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey_templates/1").to route_to("survey_templates#destroy", :id => "1")
    end

  end
end
