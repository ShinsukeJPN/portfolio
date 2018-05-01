class Teacher < ApplicationRecord
	belongs_to :user
	has_many :students, through: :requests
	has_many :rooms
	has_many :reservations
	has_many :students, through: :reservations
	enum japanese_level: {話せない: 0,日常会話レベル: 1,ビジネスレベル: 2,ネイティブレベル: 3}
	has_many :language_teachers
	has_many :languages, through: :language_teachers
	accepts_nested_attributes_for :language_teachers
end
