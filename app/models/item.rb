class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition 
  belongs_to_active_hash :postage_paye 
  belongs_to_active_hash :prefecture 
  belongs_to_active_hash :handling_tim

  with_options presence: true do
    validates :name
    validates :description_item
    validates :category_id
    validates :condition_id
    validates :postage_payes_id
    validates :prefecture_id
    validates :handling_tims_id
    validates :price
    validates :category
  end
   validates :category_id, :condition_id, :postage_payes_id, :prefecture_id, :handling_tims_id, numericality: { other_than: 1 }
  #validates :user, presence: true, foreign_key: true
end
