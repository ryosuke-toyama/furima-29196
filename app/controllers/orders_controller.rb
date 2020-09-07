class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(payment_price: order_params[:payment_price], user_id: order_params[:user_id], item_id: order_params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      @item.update(sold: true)
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token).merge(payment_price: @item.price).merge(user_id: current_user.id).merge(item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:payment_price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
