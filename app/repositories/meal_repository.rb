require_relative '../models/meal'
require_relative 'base_repository'
require "csv"

class MealRepository < BaseRepository
  def headers
    return ["id", "name", "price"]
  end

  def build_instance(row)
    row[:id] = row[:id].to_i # Convert column to Fixnum
    row[:price] = row[:price].to_i # Convert column to Fixnum
    return Meal.new(row)
  end
end
