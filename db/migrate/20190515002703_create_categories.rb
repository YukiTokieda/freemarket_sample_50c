class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.references :parent, index: true
      t.references :grandparent, index: true
      t.timestamps
    end
  end
end
