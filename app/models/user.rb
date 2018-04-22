class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :image
  enum gender: {男性: 0,
  				      女性: 1}
  has_one :teacher
  has_one :student
  has_many :rooms, through: :student
  has_many :rooms, through: :teacher
end
