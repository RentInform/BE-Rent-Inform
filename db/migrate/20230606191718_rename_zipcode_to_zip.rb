class RenameZipcodeToZip < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :zipcode, :zip
  end
end
