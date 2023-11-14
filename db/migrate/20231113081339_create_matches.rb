class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :category
      t.string :section
      t.string :home_team_name
      t.string :away_team_name
      t.string :home_team_logo
      t.string :away_team_logo
      t.datetime :match_date
      t.string :stadium_name

      t.timestamps
    end
  end
end
