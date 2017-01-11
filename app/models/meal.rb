class Meal < ActiveRecord::Base

has_many :meal_fooditems
has_many :fooditems, through: :meal_fooditems

has_many :user_meals
has_many :users, through: :user_meals

end