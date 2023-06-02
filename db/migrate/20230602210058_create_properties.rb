class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :street
      t.string :zipcode
      t.string :license_number

      t.timestamps
    end
  end
end
