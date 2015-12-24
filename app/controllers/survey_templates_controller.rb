class SurveyTemplatesController < ApplicationController
  layout 'blank', only: [:show]
  before_action :set_survey_template, only: [:show, :edit, :update, :destroy]
  before_action :set_organization, only: [:new, :create, :index]

  # GET /survey_templates
  # GET /survey_templates.json
  def index
    @survey_templates = @organization.survey_templates
  end

  # GET /survey_templates/1
  # GET /survey_templates/1.json
  def show
  end

  # GET /survey_templates/new
  def new
    @survey_template = SurveyTemplate.new
    @record = [@organization, @survey_template]
  end

  # GET /survey_templates/1/edit
  def edit
    @record = @survey_template
  end

  # POST /survey_templates
  # POST /survey_templates.json
  def create
    @survey_template = @organization.survey_templates.build(survey_template_params)

    respond_to do |format|
      if @survey_template.save
        format.html { redirect_to @survey_template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @survey_template }
      else
        format.html { render :new }
        format.json { render json: @survey_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_templates/1
  # PATCH/PUT /survey_templates/1.json
  def update
    respond_to do |format|
      if @survey_template.update(survey_template_params)
        format.html { redirect_to @survey_template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_template }
      else
        format.html { render :edit }
        format.json { render json: @survey_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_templates/1
  # DELETE /survey_templates/1.json
  def destroy
    @survey_template.destroy
    respond_to do |format|
      format.html { redirect_to organization_survey_templates_url(@organization), notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_template
      @survey_template = SurveyTemplate.find(params[:id])
      @organization = @survey_template.organization
    end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_template_params
      params.require(:survey_template).permit(:name, :description, :organization_id)
    end
end
