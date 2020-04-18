class Items::SearchesController < ApplicationController
  def index
    @items = Item.name_like(params[:keyword])
  end
end
