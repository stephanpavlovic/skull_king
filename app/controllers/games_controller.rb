class GamesController < ApplicationController
  def index
    @games = Game.not_started
  end

  def create
    @game = Game.new
    @game.set_code
    @game.save
    redirect_to game_path(@game.code)
  end

  def show
    @game = Game.find_by!(code: params[:id])
    if @game.round.zero?
      redirect_to game_players_path(@game.code) and return
    elsif @game.finished?
      redirect_to game_scoreboard_path(@game.code) and return
    end
    @round_number = params[:round_number].present? ? params[:round_number].to_i : @game.round
    @round = @game.rounds.find_or_initialize_by(number: @round_number)
  end

  private

  def game_update_params
    params.permit(:game)
  end
end
