class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :brand, optional: true
  belongs_to :category

  enum size: { empty: 0, XXSS: 1, XXS: 2, S: 3, M: 4, L: 5, XL: 6, XXL: 7, XXXL: 8, XXXXL: 9, FREE: 10 }
  enum condition: { initial: 0, mint: 1, near_mint: 2, normal: 3, some_what: 4, dirty: 5, bad: 6 }
  enum shipping_charge: { start: 0, shipping_included: 1, payment_on_delivery: 2, }
  enum origin_region: { zero: 0, hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7, ibaraki: 8, tochigi: 9, gunnma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14, niigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20, gifu: 21, shizuoka:21, aichi: 23, mie: 24, shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30, tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35, tokushima: 36, kagawa: 37, ehime: 38, kouchi: 39, fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47, mitei: 48 }
  enum shipping_days: { rei: 0, one: 1, two: 2, four: 3 }


  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :shipping_charge, presence: true
  validates :shipping_days, presence: true
  validates :origin_region, presence: true
end
