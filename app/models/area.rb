class Area < ApplicationRecord
  has_many :users
  has_many :user_areas, dependent: :destroy
end
