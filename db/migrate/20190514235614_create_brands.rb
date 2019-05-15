class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string      :name
      t.references  :brand_group, null: false, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
