class Request < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  enum status: {保留: 0,
  			  承認: 1,
  			  拒否: 2
  			  }
end
