class Items::PositionsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    render json: @item
  end

  private

  def item_params
    params.require(:item).permit(:position, :list)

  end
end
