class AddTeamRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :team, index: true, foreign_key: true, null: true
  end
end
