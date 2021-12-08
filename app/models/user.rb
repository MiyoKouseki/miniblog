class User < ApplicationRecord
  validates :profile, length {maximum: 200}
  has_secure_password
end
