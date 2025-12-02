class Round < ApplicationRecord
  belongs_to :participation

  def score
    return if result.blank?

    if result == guess
      if guess.positive?
        guess * 20
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
