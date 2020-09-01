class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence:true do
    validates :nickname
    validates :email
    validates :password
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates_format_of :first_name, with: FIRST_NAME_REGEX, message: 'Full-width characters'
  FAMILY_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates_format_of :family_name, with: FAMILY_NAME_REGEX, message: 'Full-width characters'
  FIRST_NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX, message: 'Full-width katakana characters'
  FAMILY_NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates_format_of :family_name_kana, with: FAMILY_NAME_KANA_REGEX, message: 'Full-width katakana characters'
end
