class CreateRounds < ActiveRecord::Migration[8.1]
  def change
    create_table :rounds do |t|
      t.belongs_to :participation, null: false, foreign_key: true
      t.integer :number
      t.integer :guess
      t.integer :result
      t.integer :bonus, default: 0

      t.timestamps
    end
  end
end
