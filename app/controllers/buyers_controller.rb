class BuyersController < ApplicationController
  def index
    @item_buyer = ItemBuyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item_buyer = ItemBuyer.new(buyer_params)
    @item = Item.find(params[:item_id])
    if @item_buyer.valid?
      @item_buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:item_buyer).permit(:zip_code, :ship_from_area_id, :city, :address_line_1, :address_line_2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
