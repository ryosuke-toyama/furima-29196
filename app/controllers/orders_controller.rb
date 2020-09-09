class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id || @item.sold == true
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(
      token: order_params[:token],
      postal_code: order_params[:postal_code],
      prefectures_id: order_params[:prefectures_id],
      city: order_params[:city],
      address: order_params[:address],
      building_name: order_params[:building_name],
      phone_number: order_params[:phone_number],
      user_id: order_params[:user_id],
      item_id: order_params[:item_id],
      order_id: order_params[:order_id]
    )
    if @order.valid?
      @order.save
      pay_item
      @item.update(sold: true)
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:token, :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], order_id: params[:ordar_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
