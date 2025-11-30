class CreateParticipations < ActiveRecord::Migration[8.1]
  def change
    create_table :participations do |t|
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end
end
