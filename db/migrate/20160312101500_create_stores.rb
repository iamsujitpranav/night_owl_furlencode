class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :category_id
      t.string :store_name
      t.time :open_time
      t.time :close_time
      t.string :store_owner
      t.integer :phone_no
      t.text :description
      t.integer :sub_category_id

      t.timestamps null: false
    end
  end
end
