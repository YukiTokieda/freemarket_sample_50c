class RootController < ApplicationController

  def index
    @ladies= Product.where(category_id: 159..337).limit(4)
    @mens= Product.where(category_id: 338..467).limit(4)
    @kids= Product.where(category_id: 468..586).limit(4)
    @cosmetics= Product.where(category_id: 886..952).limit(4)

    @chanel= Product.where(brand: "シャネル").limit(4)
    @loisvuitton= Product.where(brand: "ルイ ヴィトン").limit(4)
    @supreme= Product.where(brand: "シュプリーム").limit(4)
    @nike= Product.where(brand: "ナイキ").limit(4)
  end

end
