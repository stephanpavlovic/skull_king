class PlayersController < ApplicationController
  def index
    @game = Game.find_by!(code: params[:game_id])
  end
  def create
    @game = Game.find(params[:game_id])
    @player = current_player || Player.create(name: params.dig(:player, :name))
    session[:player_id] = @player.id
    @participation = @game.participations.find_or_initialize_by(player: @player)
    if @participation.save
      redirect_to game_path(@game.code)
    else
      redirect_to game_players_path(@game.code)
    end
  end
end
