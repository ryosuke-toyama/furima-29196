class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer    :payment_price,            null:false 
      t.references :user, foreign_key: true,  null:false
      t.references :item, foreign_key: true,  null:false
      t.timestamps
    end
  end
end
