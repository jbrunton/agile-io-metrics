class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_organization, only: [:new, :create, :index]
  #before_action :authenticate_user!

  # GET /teams
  # GET /teams.json
  def index
    @teams = @organization.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = @organization.teams.new
    @record = [@organization, @team]
  end

  # GET /teams/1/edit
  def edit
    @record = @team
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = @organization.teams.build(team_params)

    respond_to do |format|
      if @team.save
        current_user.add_role :admin, @team
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to organization_teams_url(@organization), notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
      @organization = @team.organization
      authorize @team
    end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :organization_id)
    end
end
