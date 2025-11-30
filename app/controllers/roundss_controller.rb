class PlayersController < ApplicationController
  def index
    @game = Game.find_by!(code: params[:game_id])
  end
  def create
    @game = Game.find(params[:game_id])
    @player = @game.players.create(player_params)
    redirect_to game_players_path(@game.code)
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
