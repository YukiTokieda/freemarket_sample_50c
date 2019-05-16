class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile
end
