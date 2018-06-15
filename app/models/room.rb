class Room < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  has_many :messages
end
