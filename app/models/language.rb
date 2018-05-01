class Language < ApplicationRecord
	has_many :language_teachers
	has_many :teachers, through: :language_teachers
end
