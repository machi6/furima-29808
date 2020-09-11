class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index ,:show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      :category_id,
      :condition_id,
      :delivery_fee_payer_id,
      :lead_time_id,
      :shipping_origin_prefecture_id,
      :image
    ).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
