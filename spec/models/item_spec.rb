require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "全ての条件がクリアできてれば出品できること" do
        expect(@item).to be_valid
      end
    end


    context '新規登録がうまくいかないとき' do

      it 'imageがないと登録できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end

      it 'nameがないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40字以上だと登録できない' do
        @item.name = 'a'*41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it 'description_itemがないと登録できない' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end

      it 'description_itemが1000文字以上だと登録できない' do
        @item.description_item = 'a'*1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item is too long (maximum is 1000 characters)")
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'postage_payes_idが1だと登録できない' do
        @item.postage_payes_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payes must be other than 1")
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'handling_tims_idが1だと登録できない' do
        @item.handling_tims_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling tims must be other than 1")
      end

      it 'priceがないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299円だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10000000円だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
