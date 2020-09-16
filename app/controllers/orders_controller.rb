class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end

  private

  def order_params
    params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user: current_user.id, item: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
