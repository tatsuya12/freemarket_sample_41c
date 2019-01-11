class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images
  has_one :delivery, dependent: :destroy
  belongs_to :user, class_name: "User", foreign_key: "seller_id"
  belongs_to :user, class_name: "User", foreign_key: "buyer_id"
  belongs_to :brand
  belongs_to :category
end
