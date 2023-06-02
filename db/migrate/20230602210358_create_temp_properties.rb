class CreateTempProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_properties do |t|
      t.string :street
      t.string :zipcode
      t.string :license_number
      t.datetime :license_created_at

      t.timestamps
    end
  end
end
