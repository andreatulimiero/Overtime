class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: true
    add_column :users, :last_name, :string, null: true
    add_column :users, :address, :string, null: true
    add_column :users, :born_on, :date, null: true
    add_column :users, :born_at, :string, null: true
  end
end
