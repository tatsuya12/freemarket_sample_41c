class Image < ApplicationRecord
<<<<<<< HEAD
  belongs_to :item
=======
  belongs_to :item, optional: true
>>>>>>> master
  mount_uploader :image, ImageUploader
end
