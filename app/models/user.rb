class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true do
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
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英数混合で入力して下さい'
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates_format_of :first_name, with: NAME_REGEX, message: 'は全角で入力してください'
  validates_format_of :family_name, with: NAME_REGEX, message: 'は全角で入力してください'
  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates_format_of :first_name_kana, with: NAME_KANA_REGEX, message: 'は全角カナで入力してください'
  validates_format_of :family_name_kana, with: NAME_KANA_REGEX, message: 'は全角カナで入力してください'
end
