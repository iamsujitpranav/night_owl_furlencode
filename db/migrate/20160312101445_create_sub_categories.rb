class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :sub_category_idZ

      t.timestamps null: false
    end
  end
end
