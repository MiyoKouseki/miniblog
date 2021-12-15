# coding: utf-8
class User < ApplicationRecord 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :microposts, dependent: :destroy
  

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :profile, length: {maximum: 200}

  def feed
    Micropost.where("user_id = ?", id)
  end
  
end
