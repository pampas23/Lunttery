class AddUsersCountToMeal < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :user_meal_likeships_count, :integer, :default => 0

    Meal.pluck(:id).each do |i|
      Meal.reset_counters(i, :user_meal_likeships)
    end
  end
end
