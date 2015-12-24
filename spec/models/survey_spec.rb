require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:survey_template) { create(:survey_template) }
  let(:question) { create(:survey_question, survey_template: survey_template) }
  let(:survey) { create(:survey, survey_template: survey_template) }

  let(:good_response) { create(:survey_response, survey_answers: [
      create(:survey_answer, survey_question: question, mood: Mood::GOOD)
  ])}

  let(:bad_response) { create(:survey_response, survey_answers: [
      create(:survey_answer, survey_question: question, mood: Mood::BAD)
  ])}

  describe "#analyse" do
    it "returns a hash of ratings for each question" do
      survey.survey_responses << good_response

      survey.survey_answers.reload
      expect(survey.analyze).to eq(question => Mood::GOOD.weight)
    end

    it "computes the mean rating for each response" do
      survey.survey_responses << good_response
      survey.survey_responses << bad_response

      survey.survey_answers.reload
      expected_rating = (Mood::GOOD.weight + Mood::BAD.weight) / 2.0
      expect(survey.analyze).to eq(question => expected_rating)
    end
  end
end
