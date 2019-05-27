require 'rails_helper'

describe 'order#create' do
  it "is invalid without a trading" do
    order = Order.new(product_id: 1)
    order.valid?
    expect(order.errors[:trading]).to include("must exist")
  end

  it "is invalid without a product" do
    order = Order.new(trading_id: 1)
    order.valid?
    expect(order.errors[:product]).to include("must exist")
  end
end

describe 'trading#create' do
  it "is invalid without a seller" do
    trading = Trading.new(buyer_id: 1)
    trading.valid?
    expect(trading.errors[:seller]).to include("must exist")
  end

  it "is invalid without a buyer" do
    trading = Trading.new(seller_id: 1)
    trading.valid?
    expect(trading.errors[:buyer]).to include("must exist")
  end
end
