class CreateSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :sns_credentials do |t|
      t.string      :uid, null: false, unique: true
      t.string      :provider, null: false
      t.text        :token
      t.references  :user, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
