class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code,           null: false
      t.integer :ship_from_area_id, null: false
      t.string :city,               null: false
      t.string :address_line_1,     null: false
      t.string :address_line_2
      t.string :phone_number,       null: false
      t.references :buyer,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
