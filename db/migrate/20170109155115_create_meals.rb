class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.integer :fooditem_id
      t.date :date_eaten
      t.time :time_eaten
      t.string :amount_eaten
    end
  end
end
