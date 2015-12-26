require 'rails_helper'

RSpec.describe Survey, type: :model do
  let(:survey_template) { create(:survey_template) }
  let(:question) { create(:survey_question, survey_template: survey_template) }
  let(:survey) { create(:survey, survey_template: survey_template) }

  let(:good_response) { create(:survey_response, survey_answers: [
      create(:survey_answer, survey_question: question, mood: Mood.GOOD)
  ])}

  let(:bad_response) { create(:survey_response, survey_answers: [
      create(:survey_answer, survey_question: question, mood: Mood.BAD)
  ])}

  describe "#rating_for" do
    context "when given just a question" do
      it "returns the rating for the given question" do
        survey.survey_responses << good_response
        expect(survey.rating_for(question)).to eq(Mood.GOOD.weight)
      end

      it "computes the mean rating for each response" do
        survey.survey_responses << good_response
        survey.survey_responses << bad_response

        expected_rating = (Mood.GOOD.weight + Mood.BAD.weight) / 2.0
        expect(survey.rating_for(question)).to eq(expected_rating)
      end
    end

    context "when given a team" do
      let(:team) { create(:team) }

      before(:each) do
        good_response.user.add_role :member, team
      end

      it "returns the rating for just that team" do
        survey.survey_responses << good_response
        survey.survey_responses << bad_response

        expect(survey.rating_for(question, team)).to eq(Mood.GOOD.weight)
      end
    end
  end
end
