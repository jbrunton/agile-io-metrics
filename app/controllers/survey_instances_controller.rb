class SurveyInstancesController < ApplicationController
  before_action :set_survey_instance, only: [:show, :edit, :update, :destroy]
  before_action :set_survey_template, only: [:index, :create, :new]

  # GET /survey_instances
  # GET /survey_instances.json
  def index
    @survey_instances = @survey_template.survey_instances
  end

  # GET /survey_instances/1
  # GET /survey_instances/1.json
  def show
  end

  # GET /survey_instances/new
  def new
    @survey_instance = SurveyInstance.new
    @record = [@survey_template, @survey_instance]
  end

  # GET /survey_instances/1/edit
  def edit
    @record = @survey_instance
  end

  # POST /survey_instances
  # POST /survey_instances.json
  def create
    @survey_instance = @survey_template.survey_instances.build(survey_instance_params)

    respond_to do |format|
      if @survey_instance.save
        format.html { redirect_to @survey_instance, notice: 'Survey instance was successfully created.' }
        format.json { render :show, status: :created, location: @survey_instance }
      else
        format.html { render :new }
        format.json { render json: @survey_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_instances/1
  # PATCH/PUT /survey_instances/1.json
  def update
    respond_to do |format|
      if @survey_instance.update(survey_instance_params)
        format.html { redirect_to @survey_instance, notice: 'Survey instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_instance }
      else
        format.html { render :edit }
        format.json { render json: @survey_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_instances/1
  # DELETE /survey_instances/1.json
  def destroy
    @survey_instance.destroy
    respond_to do |format|
      format.html { redirect_to survey_template_survey_instances_path(@survey_template), notice: 'Survey instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_instance
      @survey_instance = SurveyInstance.find(params[:id])
      @survey_template = @survey_instance.survey_template
    end

  def set_survey_template
    @survey_template = SurveyTemplate.find(params[:survey_template_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_instance_params
      params.require(:survey_instance).permit(:name, :survey_template_id)
    end
end
