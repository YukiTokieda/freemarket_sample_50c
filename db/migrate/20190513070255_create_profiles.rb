class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text        :body
      t.string      :first_name
      t.string      :last_name
      t.string      :first_name_kana
      t.string      :last_name_kana
      t.string      :birth_year
      t.string      :birth_month
      t.string      :birth_day
      t.bigint     :phone_number, unique: true
      t.integer      :zipcode
      t.integer     :prefecture
      t.string      :city
      t.string      :district
      t.string      :building
      t.references  :user, null: false, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
