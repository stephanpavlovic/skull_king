class RoundsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @participation = @game.participation_for_player(current_player)
    if @game.round.zero?
      @game.start!
      redirect_to game_path(@game.code)
    else
      @round = @participation.rounds.create(round_params)
      redirect_to game_round_path(@game, @round)
    end
  end

  def show
    @game = Game.find(params[:game_id])
    @participation = @game.participation_for_player(current_player)
    @round = @participation.rounds.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @participation = @game.participation_for_player(current_player)
    @round = @participation.rounds.find(params[:id])
    if @round.update(round_params)
      # Only move a round forward if round is completed
      @game.next_round
    end
    redirect_to game_path(@game.code, round_number: (@round.number + 1))
  end

  private

  def round_params
    params.require(:round).permit(:guess, :result, :number, :bonus)
  end
end
