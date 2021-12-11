class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_secure_password
  validates :name, format: { with: /\A[a-zA-Z]+\Z/ }, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :profile, length: {maximum: 200}
end
