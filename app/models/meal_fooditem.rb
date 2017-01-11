class MealFooditem < ActiveRecord::Base

  belongs_to :meal
  belongs_to :fooditem

end