class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :data
  end
end
