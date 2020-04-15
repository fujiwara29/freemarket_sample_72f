class ItemsController < ApplicationController

  before_action :set_category, only: [:new, :create]
  before_action :set_brand, only: [:new, :create]


  def index
    @newitems = Item.last(3)
    @images = Image.last
  end

  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  
  private

  def set_category
    @category = Category.all()
  end

  def set_brand
    @brand = []
    # @brand = Bland.all()
  end

end
