class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.integer :round, default: 0
      t.string :code

      t.timestamps
    end
  end
end
