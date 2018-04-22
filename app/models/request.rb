class Request < ApplicationRecord
	belongs_to :student
	belongs_to :teacher
	enum status: {承認: 1,拒否: 2,送信したリクエスト: 3}

end
