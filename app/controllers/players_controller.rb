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

    @at_bats = Hit.where(player_id: @player.id)
    @hits = @at_bats.reject {|x| x.hit_type_id == 1}
    @outs = Hit.where(hit_type_id: 1, player_id: @player.id).length
    @singles = Hit.where(hit_type_id: 2, player_id: @player.id).length
    @doubles = Hit.where(hit_type_id: 3, player_id: @player.id).length
    @triples = Hit.where(hit_type_id: 4, player_id: @player.id).length
    @homeruns = Hit.where(hit_type_id: 5, player_id: @player.id).length

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
