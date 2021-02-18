class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :ship_from_area_id
    validates :delivery_time_id
  end
  validates :price, presence: true,
                    numericality: { with: /\A[0-9]+\z/,
                                    message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'Out of setting range' }

  belongs_to :user
  has_one_attached :image
end
