class AddPostcodeToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :postcode, :string
  end
end