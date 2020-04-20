class Items::SearchesController < ApplicationController

  before_action :category_search

  def index
    if params[:keyword].nil?
      @category_items = Item.category_like(category_search).order("created_at DESC")
    else
      @items = Item.name_like(params[:keyword]).order("created_at DESC")
    end
  end

private

  def category_search
    params[:format]
  end

end
