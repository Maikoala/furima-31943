require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '商品投稿出来る場合' do
      it '商品画像と商品説明が存在し、カテゴリー、商品状態、配送料負担、発送元地域、発送までの日数が選択されていて、販売価格が入力されていれば保存出来ること' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿出来ない場合' do
      it '商品画像がないと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品名が41文字以上だと保存できないこと' do
        @item.name = 'abcd' * 11
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it '商品の説明がないと保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品の説明が1001文字以上だと保存できないこと' do
        @item.description = 'abcdefghij' * 101
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it 'カテゴリー情報がないと保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリー情報が「---」の時は保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品の状態についての情報がないと保存できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態についての情報が「---」の時は保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '配送料の負担についての情報がないと保存できないこと' do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it '配送料の負担についての情報が「---」の時は保存できないこと' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge Select')
      end

      it '発送元の地域についての情報がないと保存できないこと' do
        @item.ship_from_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from area can't be blank")
      end

      it '発送元の地域についての情報が「---」の時は保存できないこと' do
        @item.ship_from_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship from area Select')
      end

      it '発送までの日数についての情報がないと保存できないこと' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it '発送までの日数についての情報が「---」の時は保存できないこと' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time Select')
      end

      it '価格についての情報がないと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円を下回る時は保存できないこと' do
        @item.price = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '価格が9,999,999円を上回る時は保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '価格が全角の時保存できないこと' do
        @item.price = '６７８９'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it '価格が数字以外の時は保存できないこと' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
