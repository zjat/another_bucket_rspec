class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.timestamps null: false
      t.belongs_to :bucket, index: true, foreign_key: true
    end
  end
end
