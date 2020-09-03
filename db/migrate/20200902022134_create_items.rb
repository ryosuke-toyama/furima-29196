class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :img,                              null: false
      t.string :name,                           null: false
      t.text :message,                          null: false
      t.integer :price,                         null: false
      t.integer :user_id,                       null: false
      t.integer :category_id,                   null: false
      t.integer :sales_status_id,               null: false
      t.integer :shipping_fee_id,               null: false
      t.integer :prefecture_id,                 null: false
      t.integer :scheduled_delively_id,         null: false
      t.timestamps
    end
  end
end
