class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :birth_day, presence: true

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英字と数字の両方を含めて設定してください' } do
    validates :password
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end

  with_options format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :family_name_kana
  end
end
