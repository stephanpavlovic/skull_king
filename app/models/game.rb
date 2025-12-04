class Game < ApplicationRecord
  MAX_ROUNDS = 11
  scope :not_started, -> { where(round: 0) }
  scope :running, -> { where(round: ..MAX_ROUNDS) }

  has_many :participations
  has_many :rounds, through: :participations
  has_many :players, through: :participations

  def finish!
    update(round: MAX_ROUNDS)
  end

  def started?
    round.positive?
  end

  def finished?
    round >= MAX_ROUNDS
  end

  def start!
    update(round: 1)
  end

  def next_round
    if participations.all? { |p|
      p.rounds.find_by(number: round).completed?
    }
      update(round: round + 1)
    end
  end

  def participation_for_player(player)
    participations.find_by(player: player)
  end

  def set_code
    self.code = SecureRandom.hex(3).upcase
  end
end
