class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string      :name, null: false, index: true
      t.integer     :price, null: false, limit: 5
      t.text        :description, null: false
      t.string      :brand, default: ""
      t.references  :shipping, null: false, index: true, foreign_key: true
      t.references  :category, null: false, index: true, foreign_key: true
      t.references  :size, null: false, index: true, foreign_key: true
      t.references  :state, null: false, index: true, foreign_key: true
      t.references  :status, null: false, index: true, foreign_key: true, default: 1
      t.references  :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
