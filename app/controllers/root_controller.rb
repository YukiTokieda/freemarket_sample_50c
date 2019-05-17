class RootController < ApplicationController

  def index
    @ladies = Product.get_category(159..337)
    @mens = Product.get_category(338..467)
    @kids = Product.get_category(468..586)
    @cosmetics = Product.get_category(886..952)

    @chanel= Product.get_brand("シャネル")
    @loisvuitton= Product.get_brand("ルイ ヴィトン")
    @supreme= Product.get_brand("シュプリーム")
    @nike= Product.get_brand("ナイキ")
  end

end
