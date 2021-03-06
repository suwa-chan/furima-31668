class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英数字の両方を含めて設定してください' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カナを使用してください'} do
    validates :last_name_kana
    validates :first_name_kana
  end

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

end

