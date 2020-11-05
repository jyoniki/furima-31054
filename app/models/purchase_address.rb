class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :prefectres_id, :ctiy, :house_numbe, :building_name, :phone_number, :purchase
 
  with_options presence: true do
    validates :item, foreign_key: true
    validates :user, foreign_key: true
    validates :post_code
    validates :prefectures_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :purchase, foreign_key: true
  end
  validates :building_name

  def save
    
  end
end