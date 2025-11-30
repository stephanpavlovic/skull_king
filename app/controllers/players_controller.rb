class PlayersController < ApplicationController
  def index
    @game = Game.find_by!(code: params[:game_id])
  end
  def create
    @game = Game.find(params[:game_id])
    @player = current_player || Player.create(name: params.dig(:player, :name))
    session[:player_id] = @player.id
    if @game.participations.create(player: @player)
      redirect_to game_path(@game.code)
    else
      redirect_to game_players_path(@game.code)
    end
  end
end
