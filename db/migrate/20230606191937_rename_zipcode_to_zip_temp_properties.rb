class RenameZipcodeToZipTempProperties < ActiveRecord::Migration[7.0]
  def change
    rename_column :temp_properties, :zipcode, :zip
  end
end
