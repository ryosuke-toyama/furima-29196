class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = ItemTag.new
  end

  def create
    @item = ItemTag.new(item_params)
    @item.sold = false
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    if item.destroy
      redirect_to items_path
    else
      render :show
    end
  end
  private

  def item_params
    params.require(:item_tag).permit(:name, :message, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, :tag_name, images: []).merge(user_id: current_user.id, item_id: params[:item_id], tag_id: params[:tag_id])
  end
end
