class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :info
      t.datetime :start_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
