class Order
  # STATE
  attr_reader :meal, :employee, :customer
  attr_accessor :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal] # NOT A STRING
    @employee = attributes[:employee] # NOT A STRING
    @customer = attributes[:customer] # NOT A STRING
    @delivered = attributes[:delivered] || false
  end

  # BEHAVIOR
  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_row
    # ["id", "meal_id", "employee_id", "customer_id", "delivered"]
    [@id, @meal.id, @employee.id, @customer.id, @delivered]
  end
end

# Order.new({..., delivered: true})
# Order.new({...})
