require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CSV.foreach('db/dummy_datas/users.csv') do |record|
  User.create(nickname: record[0], email: record[1], password: record[2], password_confirmation: record[3])
end

CSV.foreach('db/dummy_datas/profiles.csv') do |record|
  Profile.create(body: record[0], first_name: record[1], last_name: record[2], first_name_kana: record[3], last_name_kana: record[4], birth_year: record[5], birth_month: record[6], birth_day: record[7], phone_number: record[8], zipcode: record[9], prefecture: record[10], city: record[11], district: record[12], building: record[13], user_id: record[14])
end

