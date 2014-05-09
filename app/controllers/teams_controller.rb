class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @players = Player.all
    @team = Team.find(params[:id])
    @team_players = @team.players
    @lineup = @team.lineup
    @bench_players = @team_players.where.not(id: @lineup)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team)
    else
      redirect_to :back
    end
  end


private
  def team_params
    params.require(:team).permit(:name, :address, :logo, :stadium_chart)
  end

end
