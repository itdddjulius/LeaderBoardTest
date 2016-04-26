class AddGameRefToScores < ActiveRecord::Migration
  def change
    add_reference :scores, :game, index: true, foreign_key: true
  end
end
