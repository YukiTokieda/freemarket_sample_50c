class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :trading
  has_one :profile, inverse_of: :user
  has_many :sns_credentials, dependent: :destroy

  accepts_nested_attributes_for :profile
  validates :nickname, presence: true

  def self.find_for_oauth(auth)
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    if sns.present?
      @user = self.where(email: auth.info.email).first
    else
      @user = User.create(nickname: auth.info.name, email: auth.info.email, password: Devise.friendly_token[0,20])
      sns = SnsCredential.create(user_id: @user.id, uid: auth.uid, provider: auth.provider)
    end
    @user
  end
end
