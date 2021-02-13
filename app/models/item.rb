class Item < ApplicationRecord
  validates_presence_of :name, 
                        :description, 
                        :category_id, 
                        :condition_id, 
                        :charge_id, 
                        :ship_from_area_id, 
                        :delivery_time_id, 
                        :price

  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, 
                                    greater_than_or_equal_to: 300,     
                                    less_than_or_equal_to: 9999999, 
                                    message: 'Price Out of setting range' },
                    format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image
end
