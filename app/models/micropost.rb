class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def make_fan(user)
    fans << user
  end
  
end
