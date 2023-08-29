class AddTitleToListings < ActiveRecord::Migration[7.0]
  def change
    # Title Added
    add_column :listings, :title, :string
  end
end
