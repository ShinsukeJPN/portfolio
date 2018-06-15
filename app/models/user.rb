class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  attachment :image
  enum gender: {男性: 0,
  				      女性: 1}
  has_one :teacher
  has_one :student
  has_many :reservations, through: :students
  has_many :reservations, through: :teachers
  has_many :rooms, through: :students
  has_many :rooms, through: :teachers
  has_many :user_areas, dependent: :destroy
  has_many :areas, through: :user_areas
  has_many :reports
  accepts_nested_attributes_for :user_areas, allow_destroy: true


  # validates :image, presence: true
  # validates :nationality, presence: true, length: { maximum: 50}
  # validates :nickname, presence: true, length: { maximum: 15}

  soft_deletable

  def self.find_for_database_authentication(warden_conditions)
    without_soft_destroyed.where(email: warden_conditions[:email]).first
  end

  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first
    unless user
      user = User.create(name:     auth.info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
     end
     user
  end

end
