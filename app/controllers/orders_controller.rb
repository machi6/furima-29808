class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end

  private

  def order_params
    params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user: current_user.id, item: params[:item_id])
  end
end
