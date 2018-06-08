class CreatePlaybookStars < ActiveRecord::Migration
  def change
    create_table :playbook_stars do |t|
      t.references :playbook, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
