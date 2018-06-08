class AddTeamRefToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :team, index: true, foreign_key: true, null: true
  end
end
