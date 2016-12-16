class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :activities, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum :role [:admin, :user]
end
