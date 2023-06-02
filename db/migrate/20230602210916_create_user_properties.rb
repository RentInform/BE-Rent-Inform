class CreateUserProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :user_properties do |t|
      t.references :property, null: false, foreign_key: true
      t.string :user_id

      t.timestamps
    end
    add_index :user_properties, :user_id
  end
end
