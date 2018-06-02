class CreatePlaybooks < ActiveRecord::Migration
  def change
    create_table :playbooks do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
