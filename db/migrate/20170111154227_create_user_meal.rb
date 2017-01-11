class CreateUserMeal < ActiveRecord::Migration[5.0]
  def change
    create_table :user_meals do |t|
      t.integer :user_id
      t.integer :meal_id
      t.date :date_eaten
      t.time :time_eaten
      t.string :data
    end
  end
end
