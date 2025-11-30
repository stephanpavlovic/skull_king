class GamesController < ApplicationController
  def index
    @games = Game.not_started
  end

  def create
    @game = Game.new
  end

  def show
    @game = Game.find_by!(code: params[:id])
    @round = Round.new(number: @game.round)
  end

  private

  def game_update_params
    params.permit(:game)
  end
end
