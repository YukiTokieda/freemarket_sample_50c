class Profile < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birth_year
    validates :birth_month
    validates :birth_day
  end
end
