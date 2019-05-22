class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :sizes, :name, unique: true
  end
end
