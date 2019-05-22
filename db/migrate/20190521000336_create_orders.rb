class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer     :status, null: false, default: "waiting_for_shipping"
      t.references  :product, null: false, index: true, foreign_key: true
      t.references  :trading, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
