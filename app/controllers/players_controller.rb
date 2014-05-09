class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
    @hit = Hit.new
    @hit_types = HitType.all
    @hits = @player.hits
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.new(player_params)
    if @player.save
      redirect_to team_player_path(@team, @player)
    else
      redirect_to :back
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(team_id: params[:team_id])
      redirect_to :back
    else
      redirect_to :back
    end
  end



private
  def player_params
    params.require(:player).permit(:name, :photo, :team_id)
  end

end
