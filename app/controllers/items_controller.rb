class ItemsController < ApplicationController
  before_action :find_item, only: [:create, :show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_charge_id, :delivery_id, :image,
                                 :pref_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user_id == current_user.id
  end
end
