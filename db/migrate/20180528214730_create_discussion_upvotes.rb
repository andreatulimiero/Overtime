class CreateDiscussionUpvotes < ActiveRecord::Migration
  def change
    create_table :discussion_upvotes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :discussion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
