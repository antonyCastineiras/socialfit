class AddOpenToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :open, :boolean
  end
end
