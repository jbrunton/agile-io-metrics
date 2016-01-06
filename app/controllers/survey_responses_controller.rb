class SurveyResponsesController < ApplicationController
  respond_to :html

  before_action :set_survey, except: [:index]
  before_action :authenticate_user_from_token!, only: [:new, :create]
  before_action :authenticate_user!, except: [:thankyou]
  after_action :verify_authorized, except: [:thankyou]

  # GET /survey_responses
  # GET /survey_responses.json
  def index
    include_options = {
      survey_responses: Survey::RELATIONS_FOR_REPORTS
    }
    @survey = Survey.includes(include_options).find(params[:survey_id])
    authorize @survey, :show_responses?
    @teams = @survey.teams
  end

  def thankyou
  end

  # GET /survey_responses/team/1
  # GET /survey_responses/team/1.json
  def team
    @team = Team.find(params[:team_id])
    authorize @survey, :show_team_responses?
    @survey_responses = @survey.responses_for(@team)
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.build_for(@survey, current_user)
    authorize @survey_response

    if already_responded?
      redirect_to_thankyou notice: "You've already responded to this survey."
    end

    @record = [@survey, @survey_response]
  end

  # POST /survey_responses
  # POST /survey_responses.json
  def create
    @survey_response = SurveyResponse.build_from(@survey, survey_response_params, current_user)
    authorize @survey_response

    if already_responded?
      redirect_to_thankyou notice: "You've already responded to this survey."
    elsif @survey_response.save
      redirect_to_thankyou notice: 'Survey response was successfully created.'
    else
      @record = [@survey, @survey_response]
      render :new
    end
  end

private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def already_responded?
    current_user.survey_responses
      .where(survey: @survey)
      .count > 0
  end

  def redirect_to_thankyou(opts = {})
    redirect_to thankyou_survey_survey_responses_path(@survey), notice: opts[:notice]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def survey_response_params
    params.require(:survey_response).permit(
        :survey_answers_attributes => [:mood_id, :survey_question_id]
    )
    #params.require(:survey_response).permit(:user_id, :survey_id)
  end
end
