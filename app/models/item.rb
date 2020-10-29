class Item < ApplicationRecord
  has_one :purchase
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description_item
    validates :category_id
    validates :condition_id
    validates :postage_payes_id
    validates :prefecture_id
    validates :handling_tims_id
    validates :price
  end
  validates :user, presence: true, foreign_key: true
end
