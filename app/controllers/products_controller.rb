class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, :set_shipping, :set_brand, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @product = Product.new
    @shipping =  Shipping.new
    @categories = Category.where(parent_id: 0)
    @states = State.all
    @product.images.build
  end

  def create
    new_product = current_user.products.new(product_params)
    if new_product.save
      images_form = params[:images][:image_form].reverse
      images_form.each do |image_form|
        new_product.images.create(name: image_form.tempfile, product_id: new_product.id)
      end
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def edit  
    @categories = Category.where(parent_id: 0)
    @states = State.all
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @product.comments
    @users_products = Product.get_user_product(@product).limit(6)
  end

  def destroy
    if @product.destroy
      redirect_to controller: :root, action: :index
    else
      redirect_to action: :show
    end
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").limit(48)
  end

  private

  def set_product
    @product = Product.find(params[:id])
    @category_grandchild = Category.find(@product.category_id)
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
  end

  def set_shipping
    @shipping = Shipping.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :category_id, :brand, :size_id, :state_id, :price,
      shipping_attributes:[:method, :prefecture_from, :period_before_shipping, :fee_burden, :_destroy, :id],
      images_attributes:[:image_form,:name, :_destroy, :id]
    )
  end
end
