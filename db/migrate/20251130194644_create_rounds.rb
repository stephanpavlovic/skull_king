class CreateRounds < ActiveRecord::Migration[8.1]
  def change
    create_table :rounds do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.integer :number
      t.belongs_to :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
