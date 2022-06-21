class OrderOrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :pref_id, :city, :address_line1, :address_line2, :number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address_line1
    validates :number
    validates :token
  end
  
  validates :pref_id, numericality: {other_than: 0}
  validates :post_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/},allow_blank: true
  validates :number,format: {with: /\d{11}/},allow_blank: true
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderAddress.create(post_code: post_code, pref_id: pref_id, city: city, address_line1: address_line1, address_line2: address_line2, number: number, order_id: order.id)
  end
end