class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :game, presence: true
  validates :player, presence: true

  after_create_commit { update_waiting_list }
  after_destroy_commit { update_waiting_list }

  def update_waiting_list
    broadcast_replace_later_to :players, target: "waiting_list", partial: "players/waiting_list", locals: { game: game }
  end

  def blub
    broadcast_replace_to :players, target: "waiting_list", partial: "players/blub", locals: { game: game }
  end
end
