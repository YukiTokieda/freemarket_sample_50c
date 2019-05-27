require 'rails_helper'

describe 'product#new' do
  it "is invalid without a name" do
    product = Product.new(name: "", price: 1000, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: 1, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a price" do
    product = Product.new(name: "name", price: nil, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: 1, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it "is invalid without a description" do
    product = Product.new(name: "name", price: 1000, description: "", brand: "", shipping_id: 1, category_id: 159, size_id: 1, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a shipping" do
    product = Product.new(name: "name", price: 1000, description: "description", brand: "", shipping_id: nil, category_id: 159, size_id: 1, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:shipping]).to include("must exist")
  end

  it "is invalid without a category" do
    product = Product.new(name: "name", price: 1000, description: "description", brand: "", shipping_id: 1, category_id: nil, size_id: 1, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:category]).to include("must exist")
  end

  it "is invalid without a size" do
    product = Product.new(name: "name", price: 1000, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: nil, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:size]).to include("must exist")
  end

  it "is invalid without a state" do
    product = Product.new(name: "name", price: 1000, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: nil, state_id: nil, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:state]).to include("must exist")
  end

  it "is invalid without a status" do
    product = Product.new(name: "name", price: 1000, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: nil, state_id: 1, status_id: nil, user_id: 1)
    product.valid?
    expect(product.errors[:status]).to include("must exist")
  end

  it "is invalid without a user" do
    product = Product.new(name: "name", price: 1000, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: nil, state_id: 1, status_id: 1, user_id: nil)
    product.valid?
    expect(product.errors[:user]).to include("must exist")
  end

  it "is invalid price greater than or equal to 300" do
    product = Product.new(name: "name", price: 299, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: nil, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:price]).to include("must be greater than or equal to 300")
  end

  it "is invalid price must be less than or equal to 9999999" do
    product = Product.new(name: "name", price: 999999999, description: "description", brand: "", shipping_id: 1, category_id: 159, size_id: nil, state_id: 1, status_id: 1, user_id: 1)
    product.valid?
    expect(product.errors[:price]).to include("must be less than or equal to 9999999")
  end
end
