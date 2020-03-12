class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :name, null: false
      t.string :character_class, null: false
      t.integer :gold, default: 0
      t.integer :xp, default: 0
      t.integer :check_marks, default: 0
      t.json :perks, default: []

      t.timestamps
    end
  end
end
