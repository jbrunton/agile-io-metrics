class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :set_survey_template, only: [:index, :create, :new]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /surveys
  # GET /surveys.json
  def index
    authorize @survey_template, :show_surveys?
    @surveys = @survey_template.surveys
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = @survey_template.surveys.build
    authorize @survey
    @record = [@survey_template, @survey]
  end

  # GET /surveys/1/edit
  def edit
    @record = @survey
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = @survey_template.surveys.build(survey_params)
    authorize @survey

    respond_to do |format|
      if @survey.save
        @survey.notify_recipients
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to survey_template_surveys_path(@survey_template), notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
      authorize @survey
      @survey_template = @survey.survey_template
    end

  def set_survey_template
    @survey_template = SurveyTemplate.find(params[:survey_template_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :survey_template_id)
    end
end
