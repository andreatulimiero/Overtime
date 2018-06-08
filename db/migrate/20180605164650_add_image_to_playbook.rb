class AddImageToPlaybook < ActiveRecord::Migration
  def change
    add_column :playbooks, :image, :string
  end
end
