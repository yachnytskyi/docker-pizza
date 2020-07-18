class User < ApplicationRecord
  has_secure_password
  has_many :news, dependent: :destroy

  validates :username, :email, :password, presence: true
end
