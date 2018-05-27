class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, default = ''
    add_column :users, :second_name, :string, default = ''
    add_column :users, :address, :string, default = ''
    add_column :users, :born_on, :date, default = ''
    add_column :users, :born_at, :string, default = ''
  end
end
