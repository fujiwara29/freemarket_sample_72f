class UsersController < ApplicationController
  def show
    @newitems = Item.all
  end

  def logout
  end
end
