class ItemTag
  include ActiveModel::Model
  attr_accessor :images, :name, :message, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, :sold, :tag_name, :user_id, :item_id, :tag_id

  validates :images, :name, :message, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delively_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'は半角数字で入力してください'

  def save
    item = Item.create(name: name, message: message, price: price, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, scheduled_delively_id: scheduled_delively_id, images: images, sold: sold, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    item_tag_relation = ItemTagRelation.new
    item_tag_relation.item_id = item.id
    item_tag_relation.tag_id = tag.id
    item_tag_relation.save
  end

  def update
    item = Item.create(name: name, message: message, price: price, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, scheduled_delively_id: scheduled_delively_id, images: images, sold: sold, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.update
  end
end
