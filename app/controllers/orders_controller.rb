class OrdersController < ApplicationController
  def index
    binding.pry
    @item = Item.find(params[:id])
  end

  def create
  end
end
