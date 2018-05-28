class CreateDiscussionStars < ActiveRecord::Migration
  def change
    create_table :discussion_stars do |t|
      t.references :discussion, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
