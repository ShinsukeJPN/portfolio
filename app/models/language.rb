class Language < ApplicationRecord
	has_many :language_teachers
	has_many :teachers, through: :language_teachers
	has_many :language_students
	has_many :students, through: :language_students
end
