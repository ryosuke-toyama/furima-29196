class ItemsController < ApplicationController
  def index
  end
  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:img, :name, :message, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id).merge(user_id: current_user.id)
  end

end
