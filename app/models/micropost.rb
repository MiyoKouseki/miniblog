class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_many :favorites, dependent: :destroy
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }


  
  def favouser
    user_ids = "SELECT user_id FROM favorites
                     WHERE micropost_id = :micropost_id"
    User.where("id IN (#{user_ids})", micropost_id: id)
  end
  
  
end
