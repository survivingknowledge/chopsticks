class User < ActiveRecord::Base

  has_secure_password

  #validations
  validates :username, presence: true
  validates :password, presence: true

  validates :username, length: {minimum:5, maximum: 30}
  validates :password, length: {minimum:5, maximum: 50}

  has_many :user_meals
  has_many :meals, through: :user_meals
  has_many :fooditems


end
