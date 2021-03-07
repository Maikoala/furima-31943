class ItemBuyer
  include ActiveModel::Model
  attr_accessor :zip_code, :ship_from_area_id, :city, :address_line_1, :address_line_2, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :ship_from_area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address_line_1
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'Input only number' }
    validates :user_id
    validates :item_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, ship_from_area_id: ship_from_area_id, city: city, address_line_1: address_line_1, address_line_2: address_line_2,  phone_number: phone_number, buyer_id: buyer.id)
  end
end