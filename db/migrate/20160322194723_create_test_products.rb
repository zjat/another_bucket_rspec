class CreateTestProducts < ActiveRecord::Migration
  def change
    create_table :test_products do |t|
      t.string :name
      t.float :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
