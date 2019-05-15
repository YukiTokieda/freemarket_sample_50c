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

CSV.foreach('db/dummy_datas/categories.csv') do |record|
  Category.create(name: record[0], parent_id: record[1], grandparent_id: record[2])
end

CSV.foreach('db/dummy_datas/brand_groups.csv') do |record|
  BrandGroup.create(name: record[0])
end

CSV.foreach('db/dummy_datas/sizes.csv') do |record|
  Size.create(name: record[0])
end

CSV.foreach('db/dummy_datas/brands.csv') do |record|
  Brand.create(name: record[0], brand_group_id: record[1])
end

CSV.foreach('db/dummy_datas/shippings.csv') do |record|
  Shipping.create(method: record[0], prefecture_from: record[1], period_before_shipping: record[2], fee_burden: record[3])
end

CSV.foreach('db/dummy_datas/states.csv') do |record|
  State.create(name: record[0])
end

CSV.foreach('db/dummy_datas/statuses.csv') do |record|
  Status.create(name: record[0])
end

CSV.foreach('db/dummy_datas/products.csv') do |record|
  Product.create(name: record[0], price: record[1], description: record[2], brand: record[3], shipping_id: record[4], category_id: record[5], size_id: record[6], state_id: record[7], status_id: record[8], user_id: record[9])
end
