class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string     :status, null: false, default: "waiting_for_shipping"
      t.references  :product, null: false, foreign_key: true
      t.references  :trading, null: false, foreign_key: true
      t.timestamps
    end
    add_index :orders, [:product_id, :trading_id], unique: true
  end
end
