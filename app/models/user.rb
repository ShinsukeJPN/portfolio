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
  has_many :reservations, through: :students
  has_many :reservations, through: :teachers
  has_many :rooms, through: :students
  has_many :rooms, through: :teachers
  has_many :areas, through: :user_areas
  has_many :user_areas, dependent: :destroy
  accepts_nested_attributes_for :user_areas, allow_destroy: true
end
