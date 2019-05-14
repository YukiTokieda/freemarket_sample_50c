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
