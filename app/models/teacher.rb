class Teacher < ApplicationRecord
  belongs_to :user
  has_many :students, through: :requests
  has_many :rooms
  has_many :reservations
  has_many :students, through: :reservations
  has_many :language_teachers
  has_many :languages, through: :language_teachers
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :language_teachers, allow_destroy: true
  enum japanese_level: {話せない: 0,日常会話レベル: 1,ビジネスレベル: 2,ネイティブレベル: 3}

  validates :message, presence: true, length: { maximum:250}
  validates :background, length: { maximum:250}
  validates :detailed_place_1, presence: true
  validates :detailed_address_1, presence: true

  paginates_per 12

  def favorited_by?(student)
    favorites.where(student_id: student.id).exists?
  end

end
