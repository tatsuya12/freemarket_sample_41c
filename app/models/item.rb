class Item < ApplicationRecord
  belongs_to :user
  belongs_to :user, foreign_key: 'id', primary_key: 'saller_id_id', class_name: 'User'
  belongs_to :user, foreign_key: 'id', primary_key: 'buyer_id_id', class_name: 'User'
end
