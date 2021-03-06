# coding: utf-8
class User < ApplicationRecord 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy  
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true,
            format: { with: /\A[a-zA-Z]+\z/,
                      message: 'alphabet is only available'},
            length: {maximum: 20}
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :profile, length: {maximum: 200}

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
  
end
