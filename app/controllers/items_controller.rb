class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.sold = false
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :message, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id).merge(user_id: current_user.id)
  end
end
