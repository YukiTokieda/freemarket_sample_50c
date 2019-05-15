class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string      :name, index: true
      t.references  :brand_group, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
