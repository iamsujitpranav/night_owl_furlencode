class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude, :decimal, {:precision=>10, :scale=>6}
      t.decimal :longitude, :decimal, {:precision=>10, :scale=>6}
      t.integer :store_id

      t.timestamps null: false
    end
  end
end
