class AddUniqueIndexToProperties < ActiveRecord::Migration[7.0]
  def change
    add_index :properties, :street, unique: true
  end
end
