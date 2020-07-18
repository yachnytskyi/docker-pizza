class News < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true
  # validate :user
end
