class SurveyResponsesController < ApplicationController
  before_action :set_survey_instance
  before_action :authenticate_user!

  # GET /survey_responses
  # GET /survey_responses.json
  def index
    @survey_responses = @survey_instance.survey_responses
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.new(survey_instance: @survey_instance)
    @survey_response.survey_answers = @survey_response.survey_instance.survey.survey_questions.map do |question|
      SurveyAnswer.new(survey_question: question)
    end
    @record = [@survey_instance, @survey_response]
  end

  # POST /survey_responses
  # POST /survey_responses.json
  def create
    @survey_response = @survey_instance.survey_responses.build(survey_response_params)
    @survey_response.user_id = current_user.id

    respond_to do |format|
      if @survey_response.save
        format.html { redirect_to survey_instance_survey_responses_path(@survey_instance), notice: 'Survey response was successfully created.' }
        format.json { render status: :created, location: @survey_response }
      else
        @record = [@survey_instance, @survey_response]
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

  def set_survey_instance
    @survey_instance = SurveyInstance.find(params[:survey_instance_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_response_params
      params.require(:survey_response).permit(
          :survey_answers_attributes => [:mood_id, :survey_question_id]
      )
      #params.require(:survey_response).permit(:user_id, :survey_instance_id)
    end
end
