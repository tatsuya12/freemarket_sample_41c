class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :brand, optional: true
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_days, presence: true
  # validates :shipping_method, presence: true
  validates :origin_region, presence: true
end
