class Request < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :product_name, presence: true
  mount_uploader :image, ImageUploader
end
