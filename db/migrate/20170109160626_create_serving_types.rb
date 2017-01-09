class CreateServingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :serving_types do |t|
      t.string :name
    end
  end
end
