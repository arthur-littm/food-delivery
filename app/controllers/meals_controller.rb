require_relative '../models/meal'
require_relative '../views/view'

class MealsController
  # User actions?

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def add
    # 1. Ask the user about the meal name
    name = @view.ask_for(:name)
    # 2. Ask the user about the price
    price = @view.ask_for(:price).to_i
    # 3. Build a meal instance
    new_meal = Meal.new(name: name, price: price)
    # 4. Give the meal to the MealRepository
    @meal_repository.add(new_meal)
  end

  def list
    # 1. Ask the repo for meals list
    meals = @meal_repository.all
    # 2. Ask the view to print meals
    @view.display_meals(meals)
  end
end
