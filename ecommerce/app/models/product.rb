class Product < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :name, :price, :category_id, presence: true
  validate :picture_size

  private
  def picture_size
    if picture.size > Settings.size_picture.megabytes
      errors.add(:picture, t "picture")
    end
  end
end
