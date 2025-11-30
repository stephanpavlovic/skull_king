class GamesController < ApplicationController
  def index
    @games = Game.not_started
  end

  def create
    @game = Game.new
  end

  def show
    @game = Game.find_by!(code: params[:id])
  end

  def next
    @game = Game.find_by!(code: params[:id])
    raise params.inspect
    @game.next_round(params)
    redirect_to game_path(@game.code)
  end

  private

  def game_update_params
    params.permit(:game)
  end
end
