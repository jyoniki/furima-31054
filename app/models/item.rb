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
    validates :name,               length: { maximum: 40 }
    validates :description_item,   length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :postage_payes_id
    validates :prefecture_id
    validates :handling_tims_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :category
    validates :image
  end
  validates :category_id, :condition_id, :postage_payes_id, :prefecture_id, :handling_tims_id, numericality: { other_than: 1 }
end
