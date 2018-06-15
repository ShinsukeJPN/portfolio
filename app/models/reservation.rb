class Reservation < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  enum status: {予定: 0,
  			    終了: 1
  			   }
end
