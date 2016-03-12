class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password
      t.string :location
      t.integer :phone_no

      t.timestamps null: false
    end
  end
end
