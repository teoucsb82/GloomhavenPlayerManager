class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :name
      t.string :character_class
      t.integer :gold
      t.integer :xp

      t.timestamps
    end
  end
end
