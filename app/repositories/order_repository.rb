require_relative "base_repository"
require_relative "../models/order"
require 'pry'

class OrderRepository < BaseRepository
  def initialize(csv_file_path, meal_repo, employee_repo, customer_repo)
    @meal_repository = meal_repo
    @employee_repository = employee_repo
    @customer_repository = customer_repo

    super(csv_file_path)
  end

  def headers
    return ["id", "meal_id", "employee_id", "customer_id", "delivered"]
  end

  def build_instance(row)
    id = row[:id].to_i
    delivered = row[:delivered] == "true"
    # use id in csv to find the instance in repo (with find)
    meal_id = row[:meal_id].to_i
    meal = @meal_repository.find(meal_id)
    # use id in csv to find the instance in repo (with find)
    customer_id = row[:customer_id].to_i
    customer = @customer_repository.find(customer_id)
    # use id in csv to find the instance in repo (with find)
    employee_id = row[:employee_id].to_i
    employee = @employee_repository.find(employee_id)

    return Order.new({id: id, meal: meal, customer: customer, employee: employee, delivered: delivered})
  end

  def undelivered_orders
    @elements.select do |order|
      !order.delivered? # == false
    end
  end

  def undelivered_orders_from(employee)
    undelivered_orders.select do |order|
      order.employee.id == employee.id
    end
  end



end
