class Review < ApplicationRecord
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  attachment :picture

  belongs_to :user

  belongs_to :genre

  acts_as_taggable

  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
