class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delively

  validates :img, :name, :message, :price, :category, :sales_status, :shipping_fee, :prefecture, :scheduled_delively, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, numericality: {other_than: 0}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_rhan_or_equal_to: 9999999, only_integer: true}
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Half-width number'
end
