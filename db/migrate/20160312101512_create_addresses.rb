class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address_line1
      t.text :address_line2
      t.string :landmark
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
