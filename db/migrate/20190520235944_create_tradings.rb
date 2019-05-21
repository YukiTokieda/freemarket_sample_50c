class CreateTradings < ActiveRecord::Migration[5.0]
  def change
    create_table :tradings do |t|
      t.references :buyer, null: false, index: true, foreign_key: { to_table: :users }
      t.references :seller, null: false, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
