class LanguageTeacher < ApplicationRecord
	belongs_to :teacher, optional: true
	belongs_to :language, optional: true
end
