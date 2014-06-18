class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.date :match_date
      t.integer :score1
      t.integer :score2

      t.timestamps
    end
  end
end
