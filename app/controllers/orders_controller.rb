class OrdersController < ApplicationController

  def index
   @order = OrderOrderAddress.new
   @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderOrderAddress.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_order_address).permit(:post_code, :pref_id, :city, :address_line1, :address_line2, :number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
