class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  validates :name, presence: true,length: { maximum: 20 }
 validates :email, presence: true, uniqueness: true
 validates :password, presence: true

  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
