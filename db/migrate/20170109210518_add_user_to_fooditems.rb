class AddUserToFooditems < ActiveRecord::Migration[5.0]
  def change
    add_column :fooditems, :user_id, :integer
  end
end
