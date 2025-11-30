class Game < ApplicationRecord
  MAX_ROUNDS = 10
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

  private

  def set_code
    self.code = SecureRandom.hex(3).upcase
  end
end
