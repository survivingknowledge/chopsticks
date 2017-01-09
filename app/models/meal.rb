class Meal < ActiveRecord::Base

  has_many :fooditems, through: :meal_fooditems
  has_many :meal_fooditems
  belongs_to :user

end