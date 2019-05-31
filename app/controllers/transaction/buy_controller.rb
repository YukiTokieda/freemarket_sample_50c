class Transaction::BuyController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  require "payjp"

  def show
    @card = Creditcard.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "mypage/creditcard", action: "new"
    else
      Payjp.api_key = "sk_test_50ea21ccb6048ef447419b69"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
    @trading = Trading.new(buyer_id: current_user.id, seller_id: @product.user_id)
    if @trading.save
      @order = Order.new(trading_id: @trading.id, product_id: @product.id)
      if @order.save
        @product.update(status_id: 2)
        card = Creditcard.where(user_id: current_user.id).first
        Payjp.api_key = "sk_test_50ea21ccb6048ef447419b69"
        Payjp::Charge.create(
          amount: @product.price, #支払金額
          customer: card.customer_id, #顧客ID
          currency: 'jpy', #日本円
        )
      else
        # TODO: 決済失敗時の処理
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
