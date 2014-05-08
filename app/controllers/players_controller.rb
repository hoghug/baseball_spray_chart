class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @hit = Hit.new
    @hits = @player.hits
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      redirect_to :back
    end
  end



private
  def player_params
    params.require(:player).permit(:name, :photo)
  end

end
