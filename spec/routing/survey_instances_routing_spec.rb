require "rails_helper"

RSpec.describe SurveyInstancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/surveys/1/survey_instances").to route_to("survey_instances#index", :survey_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/surveys/1/survey_instances/new").to route_to("survey_instances#new", :survey_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/survey_instances/1").to route_to("survey_instances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survey_instances/1/edit").to route_to("survey_instances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/surveys/1/survey_instances").to route_to("survey_instances#create", :survey_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey_instances/1").to route_to("survey_instances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey_instances/1").to route_to("survey_instances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey_instances/1").to route_to("survey_instances#destroy", :id => "1")
    end

  end
end
