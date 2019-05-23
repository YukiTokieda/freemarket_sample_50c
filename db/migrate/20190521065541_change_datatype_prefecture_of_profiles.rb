class ChangeDatatypePrefectureOfProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :prefecture, :string
  end
end
