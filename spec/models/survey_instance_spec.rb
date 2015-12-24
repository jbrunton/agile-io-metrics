require 'rails_helper'

RSpec.describe SurveyInstance, type: :model do
  let(:survey) { create(:survey) }
  let(:question) { create(:survey_question, survey: survey) }
  let(:survey_instance) { create(:survey_instance, survey: survey) }

  let(:good_response) { create(:survey_response, survey_answers: [
      create(:survey_answer, survey_question: question, mood: Mood::GOOD)
  ])}

  let(:bad_response) { create(:survey_response, survey_answers: [
      create(:survey_answer, survey_question: question, mood: Mood::BAD)
  ])}

  describe "#analyse" do
    it "returns a hash of ratings for each question" do
      survey_instance.survey_responses << good_response

      survey_instance.survey_answers.reload
      expect(survey_instance.analyze).to eq(question => Mood::GOOD.weight)
    end

    it "computes the mean rating for each response" do
      survey_instance.survey_responses << good_response
      survey_instance.survey_responses << bad_response

      survey_instance.survey_answers.reload
      expected_rating = (Mood::GOOD.weight + Mood::BAD.weight) / 2.0
      expect(survey_instance.analyze).to eq(question => expected_rating)
    end
  end
end
