class ItemsController < ApplicationController
  def index
    @items = current_user.items
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      @items = current_user.items
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:title)
  end
end
