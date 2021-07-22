class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10 || 11}\z/, message: "is invalid"}

  end
  validates :delivery_area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # _idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end