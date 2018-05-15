Student.seed do |s|
	s.id = 1
	s.user_id = 1
	s.budget = 2000
	s.message = "日本語教えてください。"
	s.first_language = "英語"
end

Student.seed do |s|
	s.id = 2
	s.user_id = 2
	s.budget = 2500
	s.message = "英語を教えてください。"
	s.first_language = "日本語"
end

Student.seed do |s|
	s.id = 3
	s.user_id = 3
	s.budget = 2000
	s.message = "英語が大好きです。"
	s.first_language = "英語"
end

Student.seed do |s|
	s.id = 4
	s.user_id = 4
	s.budget = 3000
	s.message = "スペイン語を学びたいです。"
	s.first_language = "韓国語"
end