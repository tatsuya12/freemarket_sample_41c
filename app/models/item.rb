class Item < ApplicationRecord
<<<<<<< HEAD
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :delivery, dependent: :destroy
  belongs_to :brand
  belongs_to :category
end
