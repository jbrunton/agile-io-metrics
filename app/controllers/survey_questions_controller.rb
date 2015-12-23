class SurveyQuestionsController < ApplicationController
  before_action :set_survey_question, only: [:update, :destroy]

  # POST /survey_questions
  # POST /survey_questions.json
  def create
    @survey = Survey.find(params[:survey_id])
    @survey_question = @survey.survey_questions.build(survey_question_params)

    respond_to do |format|
      if @survey_question.save
        format.json { render :show, status: :created, location: @survey_question }
      else
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_questions/1
  # PATCH/PUT /survey_questions/1.json
  def update
    respond_to do |format|
      if @survey_question.update(survey_question_params)
        format.html { redirect_to @survey_question, notice: 'Survey question was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_question }
      else
        format.html { render :edit }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_questions/1
  # DELETE /survey_questions/1.json
  def destroy
    @survey_question.destroy
    respond_to do |format|
      format.html { redirect_to survey_questions_url, notice: 'Survey question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_question
      @survey_question = SurveyQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_question_params
      params.require(:survey_question).permit(:title, :text, :survey_id)
    end
end
