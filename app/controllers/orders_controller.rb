require_relative "../views/view"
require_relative "../models/order"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = View.new
  end

  # all the orders
  def list_undelivered_orders
    # array of undelivered orders
    orders = @order_repository.undelivered_orders
    # send the array to the view
    @view.display_orders(orders)
  end

  def add
    # ask for ids
    meal_id = @view.ask_for("meal id").to_i
    customer_id = @view.ask_for("customer id").to_i
    employee_id = @view.ask_for("employee id").to_i
    # find the meal instance with that id
    meal = @meal_repository.find(meal_id)
    customer = @customer_repository.find(customer_id)
    employee = @employee_repository.find(employee_id)
    order = Order.new(meal: meal, customer: customer, employee: employee)
    # save to csv
    @order_repository.add(order)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    id = @view.ask_for("id").to_i
    order = @order_repository.find(id)
    order.deliver!
    @order_repository.write_csv
  end

  # for one specific employee
  def list_my_orders(employee)
    # get undelivered from one employee
    orders = @order_repository.undelivered_orders_from(employee)
    @view.display_orders(orders)
  end

end
