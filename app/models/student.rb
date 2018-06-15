class Student < ApplicationRecord
  belongs_to :user
  has_many :teachers, through: :requests
  has_many :rooms
  has_many :reservations
  has_many :teachers, through: :reservations
  has_many :language_students
  has_many :languages, through: :language_students
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :language_students, allow_destroy: true
  enum japanese_level: {話せない: 0,日常会話レベル: 1,ビジネスレベル: 2,ネイティブレベル: 3}


  validates :message, presence: true, length: { maximum: 250}
  validates :what_to_learn, presence: true, length: { maximum: 250}

  paginates_per 12

end
