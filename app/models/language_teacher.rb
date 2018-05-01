class LanguageTeacher < ApplicationRecord
	belongs_to :teacher, optional: true
	belongs_to :language, optional: true
	enum language_level: {日常会話レベル: 0,　ビジネスレベル: 1, ネイティブ: 2}
end
