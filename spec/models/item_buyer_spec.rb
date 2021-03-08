require 'rails_helper'

RSpec.describe ItemBuyer, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @item_buyer = FactoryBot.build(:item_buyer)
    @item_buyer.item_id = @item.id
    @item_buyer.user_id = @user.id
    sleep(0.1)
  end

  describe '購入情報の保存' do
    context '購入情報の保存がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item_buyer).to be_valid
      end

      it 'address_line_2が空でも保存できること' do
        @item_buyer.address_line_2 = nil
        expect(@item_buyer).to be_valid
      end
    end

    context '購入情報の保存がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @item_buyer.token = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip_codeが空だと保存できないこと' do
        @item_buyer.zip_code = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeにハイフンがないと保存できないこと' do
        @item_buyer.zip_code = "2345678"
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Zip code Input correctly')
      end

      it 'zip_codeが全角だと保存できないこと' do
        @item_buyer.zip_code = "１２３４５６７"
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Zip code Input correctly')
      end

      it 'zip_codeが数字以外だと保存できないこと' do
        @item_buyer.zip_code = "abcdefg"
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Zip code Input correctly')
      end

      it 'ship_from_area_idが空だと保存できないこと' do
        @item_buyer.ship_from_area_id = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("Ship from area can't be blank")
      end

      it 'ship_from_area_idを選択していないと保存できないこと' do
        @item_buyer.ship_from_area_id = 1
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Ship from area Select')
      end

      it 'cityが空だと保存できないこと' do
        @item_buyer.city = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'address_line_1が空だと保存できないこと' do
        @item_buyer.address_line_1 = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("Address line 1 can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @item_buyer.phone_number = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数字以外だと保存できないこと' do
        @item_buyer.phone_number = 'abcdefghijk'
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberが全角だと保存できないこと' do
        @item_buyer.phone_number = '０８０１１１１２２２２'
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberにハイフンがあると保存できないこと' do
        @item_buyer.phone_number = '080-3333-4444'
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @item_buyer.phone_number = '080111122222'
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
          @item_buyer.phone_number = '033334444'
          @item_buyer.valid?
          expect( @item_buyer.errors.full_messages).to include('Phone number Input only number')
      end

      it 'user_idが空だと保存できないこと' do
        @item_buyer.user_id = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @item_buyer.item_id = nil
        @item_buyer.valid?
        expect( @item_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
