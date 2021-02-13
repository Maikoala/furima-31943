class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday
  validates :first_name, :last_name,
            format: { with: /\A[ぁ-んァ-ン一-龥々]/,
                      message: 'Full-width characters' }
  validates :first_name_kana, :last_name_kana,
            format: { with: /\A([ァ-ン]|ー)+\z/,
                      message: 'Full-width katakana characters' }
  validates :password,
            format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/,
                      message: 'Include both letters and numbers' }

  has_many :items
end
