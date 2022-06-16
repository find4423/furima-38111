class Item < ApplicationRecord
  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :condition_id
    validates :category_id
    validates :shipping_charge_id
    validates :delivery_id
    validates :pref_id
  end

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, numericality: {in:300..9999999}
  end

  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :pref
  belongs_to :delivery
  belongs_to :shipping_charge
end
