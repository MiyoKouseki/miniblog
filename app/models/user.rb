# coding: utf-8
class User < ApplicationRecord
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
                             message: "英数字のみが使えます"}
  validates :profile, length: {maximum: 200}
  has_secure_password
end
