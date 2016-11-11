class CreateUserMealLikeships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_meal_likeships do |t|
      t.integer :user_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
