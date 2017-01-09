class CreateMealFooditems < ActiveRecord::Migration[5.0]
  def change
    create_table :meal_fooditems do |t|
      t.integer :meal_id
      t.integer :fooditem_id
    end
  end
end
