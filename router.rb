class Router
  def initialize(meals_controller, customers_controller, session_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @session_controller = session_controller
    @orders_controller = orders_controller
  end

  def run
    # check if user is allowed
    @employee = @session_controller.sign_in
    # ask for username / password
    # find the employee based on username and see if password match
    # if yes continue
    # if no ask again for login
    loop do
      if @employee.manager?
        # 1. Print the menu
        print_menu_manager
        # 2. Ask the user what he/she wants to do next?
        action = get_action
        # 3. Call the right controller method
        route_manager(action)
      elsif @employee.delivery_guy?
        # 1. Print the menu
        print_menu_delivery_guy
        # 2. Ask the user what he/she wants to do next?
        action = get_action
        # 3. Call the right controller method
        route_delivery_guy(action)
      end
    end
  end

  private

  def get_action
    puts 'What do you want to do next?'
    print '> '
    action = gets.chomp.to_i
  end

  def route_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    else
      puts 'Wrong action'
    end
  end

  def route_delivery_guy(action)
    case action
    when 1 then puts @orders_controller.list_my_orders(@employee)
    when 2 then puts @orders_controller.mark_as_delivered(@employee)
    else
      puts 'Wrong action'
    end
  end

  def print_menu_manager
    puts '1. Add a meal'
    puts '2. List available meals'
    puts '3. Add a customer'
    puts '4. List customers'
    puts '5. List undelivered orders'
    puts '6. Add an order'
  end

  def print_menu_delivery_guy
    puts '1. See my orders'
    puts '2. Mark order as complete'
  end
end
