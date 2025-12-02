class ScoreboardsController < ApplicationController
  def show
    @game = Game.find_by!(code: params[:game_id])
    @participations = @game.participations
    @participation = @game.participations.find_by(player: current_player)
    @last_unfinished_round = @participation.rounds.find_by(result: nil)&.number || @game.round
  end
end
