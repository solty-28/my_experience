class Review < ApplicationRecord
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  attachment :picture
end
