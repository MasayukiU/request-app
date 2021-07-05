class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :regular_id
      t.string  :quantity,   null: false
      t.string  :price,   null: false
      t.string  :total_price,    null: false
      t.string  :description
      t.text :image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
