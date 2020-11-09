require 'rails_helper'
describe PurchaseAddress do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '購入ができる' do
    context '購入がうまくいくとき' do
      it '全ての条件がクリアできれば購入ができる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入がうまく出来ない時' do
      it 'post_codeがないと登録できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがないと登録できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが1だと登録できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @purchase_address.phone_number = '123456789123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
