class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :address, :string
    add_column :users, :born_on, :date
    add_column :users, :born_at, :string
  end
end
