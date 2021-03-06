class HitsController < ApplicationController

  def create
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:player_id])
    @hit = @player.hits.create(hit_params)
    respond_to do |format|
      format.html { redirect_to team_player_path(@team, @player) }
      format.js
    end
  end

  def destroy
    @player = Player.find(params[:player_id])
    @hit = Hit.find(params[:id])
    @hit.destroy

    respond_to do |format|
      format.html { redirect_to team_player_path(@team, @player) }
      format.js
    end

  end

private
  def hit_params
    params.require(:hit).permit(:coords, :hit_type_id)
  end

end
