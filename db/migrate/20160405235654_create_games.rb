class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :gameID

      t.timestamps null: false
    end
  end
end
