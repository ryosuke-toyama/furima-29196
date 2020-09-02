class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shippinb_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delively

  validates :img, :name, :text, :price, :category, :sales_status, :shippinb_fee_status, :prefecture, :scheduled_delively, presence: true
  validates :category_id, :sales_status_id, :shippinb_fee_status_id, :prefecture_id, :scheduled_delively_id, numericality: {other_than: 1}
end
