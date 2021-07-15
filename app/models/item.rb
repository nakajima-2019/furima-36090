class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_state_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_burden_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "can't be blank or out of range or 販売価格は半角で入力してください."}, format: { with: /\A[0-9]+\z/ }

end
