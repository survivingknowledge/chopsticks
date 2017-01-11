class Meal < ActiveRecord::Base

has_many :meal_fooditems
has_many :fooditems, through: :meal_fooditems

end