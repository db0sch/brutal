class Items::PositionsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    @item.update(position: params[:position])
    render json: @item
  end
end
