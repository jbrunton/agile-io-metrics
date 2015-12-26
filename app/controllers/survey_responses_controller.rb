class SurveyResponsesController < ApplicationController
  before_action :set_survey, except: [:index]
  before_action :authenticate_user!

  # GET /survey_responses
  # GET /survey_responses.json
  def index
    include_options = {
      survey_responses: [
        :user,
        survey_answers: [
          :mood,
          :survey_response
        ]
      ]
    }
    @survey = Survey.includes(include_options).find(params[:survey_id])
    @teams = @survey.teams
  end

  # GET /survey_responses/team/1
  # GET /survey_responses/team/1.json
  def team
    @team = Team.find(params[:team_id])
    @survey_responses = @survey.responses_for(@team)
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.build_for(@survey, current_user)
    @record = [@survey, @survey_response]
  end

  # POST /survey_responses
  # POST /survey_responses.json
  def create
    @survey_response = SurveyResponse.build_from(@survey, survey_response_params, current_user)

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to survey_survey_responses_path(@survey), notice: 'Survey response was successfully created.' }
        format.json { render status: :created, location: @survey_response }
      else
        @record = [@survey, @survey_response]
        format.html { render :new }
        format.json { render json: @survey_response.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = SurveyResponse.find(params[:id])
    end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_params
      params.require(:survey_response).permit(
          :survey_answers_attributes => [:mood_id, :survey_question_id]
      )
      #params.require(:survey_response).permit(:user_id, :survey_id)
    end
end
