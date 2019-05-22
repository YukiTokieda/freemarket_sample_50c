class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.references :product, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
