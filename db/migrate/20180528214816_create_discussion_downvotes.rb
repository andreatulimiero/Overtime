class CreateDiscussionDownvotes < ActiveRecord::Migration
  def change
    create_table :discussion_downvotes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :discussion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
