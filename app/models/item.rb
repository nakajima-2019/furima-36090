class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"}  do
    validates :category_id
    validates :item_state_id
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

  validates :selling_price,presence: true
  validates_inclusion_of :selling_price,in:300..9999999, message: "out of range"
  validates :selling_price,format: { with: /\A[0-9]+\z/, message: "half-width input"}

  # validates_inclusion_of :selling_price,in: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of range"}

end
