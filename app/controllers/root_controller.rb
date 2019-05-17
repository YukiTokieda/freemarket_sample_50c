class RootController < ApplicationController

  def index
    @ladies= Product.where(category_id: 159..337).limit(4)
    @mens= Product.where(category_id: 338..467).limit(4)
    @kids= Product.where(category_id: 468..586)
    @cosmetics= Product.where(category_id: 886..952)

    @chanel= Product.where(brand: "シャネル")
    @loisvuitton= Product.where(brand: "ルイヴィトン")
    @supreme= Product.where(brand: "シュプリーム")
    @nike= Product.where(brand: "ナイキ")
  end

end
