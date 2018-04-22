User.seed do |s|
	s.id = 1
	s.nickname = "Dennis@1test"
	s.nationality = "フランス"
	s.gender = 0
	s.age = 30
	s.email = "1@1"
	s.password = "111111"
	s.image = Rails.root.join("db/fixtures/images/man.png").open
end

User.seed do |s|
	s.id = 2
	s.nickname = "ももち@2test"
	s.nationality = "日本"
	s.gender = 1
	s.age = 25
	s.email = "2@2"
	s.password = "222222"
	s.image = Rails.root.join("db/fixtures/images/momochi.png").open
end

User.seed do |s|
	s.id = 3
	s.nickname = "Alex@3test"
	s.nationality = "アメリカ"
	s.gender = 0
	s.age = 28
	s.email = "3@3"
	s.password = "333333"
	s.image = Rails.root.join("db/fixtures/images/man3.png").open
end

User.seed do |s|
	s.id = 4
	s.nickname = "Thammer@4test"
	s.nationality = "サウジアラビア"
	s.gender = 0
	s.age = 31
	s.email = "4@4"
	s.password = "444444"
	s.image = Rails.root.join("db/fixtures/images/man2.png").open
end