class RootController < ApplicationController

  def index
    @ladies       = Product.get_ladies.limit(4).includes(:images)
    @mens         = Product.get_mens.limit(4).includes(:images)
    @kids         = Product.get_kids.limit(4).includes(:images)
    @cosmetics    = Product.get_cosmetics.limit(4).includes(:images)
    @chanel       = Product.get_chanel.limit(4).includes(:images)
    @loisvuitton  = Product.get_loisvuitton.limit(4).includes(:images)
    @supreme      = Product.get_supreme.limit(4).includes(:images)
    @nike         = Product.get_nike.limit(4).includes(:images)
  end

end
