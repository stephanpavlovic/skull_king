class Game < ApplicationRecord
  MAX_ROUNDS = 11
  scope :not_started, -> { where(round: 0) }
  scope :running, -> { where(round: ..MAX_ROUNDS) }

  has_many :participations
  has_many :players, through: :participations

  before_validation :set_code, only: :create

  def finish!
    update(round: MAX_ROUNDS)
  end

  def started?
    round.positive?
  end

  def finished?
    round >= MAX_ROUNDS
  end

  def next_round
    update(round: round + 1)
  end

  def participation_for_player(player)
    participations.find_by(player: player)
  end

  private

  def set_code
    self.code = SecureRandom.hex(3).upcase
  end
end
