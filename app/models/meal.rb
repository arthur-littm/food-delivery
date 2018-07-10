class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    # id, name, price
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def to_row
    return [@id, @name, @price]
  end
end
