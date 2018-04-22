class Student < ApplicationRecord
	belongs_to :user
	has_many :teachers, through: :request
	has_many :rooms
	has_many :teachers, through: :reservation
	enum japanese_level: {話せない: 0,日常会話レベル: 1,ビジネスレベル: 2,ネイティブレベル: 3}
end
