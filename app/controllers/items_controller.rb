class ItemsController < ApplicationController

  # before_action :move_to_index, except: [:index, :show]
  # ⬆ URL手打ち不正アクセス防止の為
  # ⬆ ユーザーログイン機能が無い間はコメントアウトにしておきます。

  def index
    @newitems = Item.last(3)
  end


  def new
  end

  def show
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
