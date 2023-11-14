class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :posted_image
      t.string :title
      t.text :description
      t.string :select_match
      t.integer :max_number
      t.string :tichet
      t.datetime :meet_time
      t.string :address
      t.string :category
      t.string :section
      t.string :home_team_name
      t.string :away_team_name
      t.string :home_team_logo
      t.string :away_team_logo
      t.datetime :match_date
      t.string :stadium_name
      t.references :user, foreign_key: true

      t.timestamps
    end
    # add_foreign_key :posts, :user, column: :user_id, primary_key: :id
  end
end
