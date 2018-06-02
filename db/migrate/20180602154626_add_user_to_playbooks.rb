class AddUserToPlaybooks < ActiveRecord::Migration
  def change
    add_reference :playbooks, :user, index: true, foreign_key: true
  end
end
