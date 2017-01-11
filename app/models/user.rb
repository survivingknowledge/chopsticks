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

  #remove user_id from meals
  #serving_size in fooditem is string instead of int (change)

  #get all meals for today for user
  def meals_today
    d = Date.today    # don't need to convert it .strftime('%Y-%m-%d')
    self.meals.select{|meal| meal.date_eaten == d}
  end

end
