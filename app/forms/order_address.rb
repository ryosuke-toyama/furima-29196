class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :order_id

  validates :token, :postal_code, :city, :address, :phone_number, :prefectures_id, presence: true
  validates :prefectures_id, numericality: { other_than: 0, message: 'を選択してください' }

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX, message: 'ハイフン(-)を含めた7桁で入力してください'
  PHONE_NUMBER_REGEX = /\A\d{11}\z/.freeze
  validates_format_of :phone_number, with: PHONE_NUMBER_REGEX, message: '数字のみの11桁で入力してください'

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
