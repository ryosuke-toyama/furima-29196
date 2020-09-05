class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, :city, :address, :phone_number, :prefecture, presence: true
  validates :prefecture_id { other_than: 0, message: 'Select' }

  POSTAL_CODE_REGEX =/\A\d{3}[-]\d{4}\z/.freeze
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX, message: 'Include both letters and numbers'
  PHONE_NUMBER_REGEX =/\A\d{11}\z/.freeze
  validates_format_of :phone_number, with: PHONE_NUMBER_REGEX, message: 'Include both letters and numbers'

end
