require_relative '../views/view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = View.new
  end

  def add
    # 1. Ask for the name
    name = @view.ask_for(:name)
    # 2. Ask for the address
    address = @view.ask_for(:address)
    # 3. Create the customer
    new_customer = Customer.new(name: name, address: address)
    # 4. Store in the repo
    @customer_repository.add(new_customer)
  end

  def list
    customers = @customer_repository.all
    @view.display_customers(customers)
  end
end
