class Review < ApplicationRecord
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  ## refile関連
  attachment :picture

  belongs_to :user

  belongs_to :genre

  acts_as_taggable

  validates :title, presence: true
  validates :review_body, presence: true
  validates :rating, presence: true

  ##いいね機能関連
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
