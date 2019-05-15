class DeleteNameUniqIndexFromCategoy < ActiveRecord::Migration[5.0]
  def change
    remove_index :categories, :name
  end
end
