class Category < ApplicationRecord
  has_many :news, dependent: :destroy
end
