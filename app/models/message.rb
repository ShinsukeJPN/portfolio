class Message < ApplicationRecord
  belongs_to :room
  validates :comment, presence: true
end