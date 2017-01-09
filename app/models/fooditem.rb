class Fooditem < ActiveRecord::Base

  has_many :serving_types
  has_many :meal_fooditems
  belongs_to :user

end