class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  has_many :images, dependent: :destroy
  belongs_to :brand
  belongs_to :category
  mount_uploader :image, ImageUploader
end
