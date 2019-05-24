class Order < ApplicationRecord
  belongs_to :product
  belongs_to :trading

  enum status: {
    waiting_for_shipping: '発送待ち', 
    sent: '発送済み',
    under_delivery: '配達中',
    delivered: '配達済み'
  }
end
