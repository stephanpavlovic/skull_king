class Round < ApplicationRecord
  belongs_to :participation

  def completed?
    guess.present? && result.present?
  end

  def score
    return unless completed?

    if result == guess
      if guess.positive?
        (guess * 20) + bonus
      else
        number * 10
      end
    elsif guess.positive?
      -10 * ((guess - result).abs)
    else
      - 10 * number
    end
  end
end
