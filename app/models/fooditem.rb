class Fooditem < ActiveRecord::Base

  has_many :meal_fooditems
  has_many :meals, through: :meal_fooditems
  belongs_to :user

  def servingtype
    ServingType.all.find{|i| i.id == self.serving_type_id}.name
  end

end