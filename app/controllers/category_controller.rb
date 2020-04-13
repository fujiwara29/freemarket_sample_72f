class CategoryController < ApplicationController
  def index
    @category_parent = Category.where(ancestry: params[:id])

  end

  def show
    @category = Category.find(params[:id])
    
  end
end

