class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    params.require(:item).permit(
      :user_id, 
      :name, 
      :price, 
      :description, 
      :category_id, 
      :condition_id, 
      :delivery_fee_payer_id, 
      :lead_time_id, 
      :shipping_origin_prefecture_id,
      :image
      )
  end
end
