class LanguageStudent < ApplicationRecord
	belongs_to :language, optional: :true
	belongs_to :student, optional: :true
end
