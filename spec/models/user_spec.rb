require 'rails_helper'
describe User do
  describe '#create' do
    it 'is invalid without a nickname' do
     user = User.new(nickname: '', email: '')
     user.valid?
     expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end