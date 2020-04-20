class UsersController < ApplicationController
  def show
    @user_items = Item.where(user: params[:id])
  end

  def logout
  end
end
