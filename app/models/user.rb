class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :reviews, through: :favorites
  has_many :comments
  has_many :genres
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
end
