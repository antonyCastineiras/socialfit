class AddAcceptedToInvites < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :accepted, :boolean
  end
end
