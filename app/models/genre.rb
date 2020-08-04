class Genre < ApplicationRecord
  belongs_to :user

  has_many :reviews

  validates :genre_name, presence: true
end
