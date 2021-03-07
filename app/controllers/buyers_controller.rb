class BuyersController < ApplicationController 
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_index_buy, only: [:index, :create]

  def index
    @item_buyer = ItemBuyer.new
  end

  def create
    @item_buyer = ItemBuyer.new(buyer_params)
    @item = Item.find(params[:item_id])
    if @item_buyer.valid?
      pay_item
      @item_buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:item_buyer).permit(:zip_code, :ship_from_area_id, :city, :address_line_1, :address_line_2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item[:price],
      card: buyer_params[:token],
      currency: 'jpy'  
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
  end

  def move_to_index_buy
    redirect_to root_path if user_signed_in? && @item.buyer.present?
  end
end
