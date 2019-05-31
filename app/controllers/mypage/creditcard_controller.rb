class Mypage::CreditcardController < ApplicationController
  before_action :authenticate_user!

  require "payjp"
  
  def index#Cardのデータpayjpに送り情報を取り出します
    @card = Creditcard.where(user_id: current_user.id).first
    if !@card.blank?
      Payjp.api_key ="sk_test_50ea21ccb6048ef447419b69"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
    
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key ="sk_test_50ea21ccb6048ef447419b69"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_id
      @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditcard.save
        redirect_to action: :index
      else
        redirect_to action: :new
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Creditcard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key ="sk_test_50ea21ccb6048ef447419b69"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

end