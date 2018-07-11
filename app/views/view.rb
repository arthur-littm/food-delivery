class View
  def ask_for(something)
    puts "#{something}?"
    print '> '
    gets.chomp
  end

  def welcome
    puts "Welcome, successful login! Yay"
  end

  def unsuccessful_credentials
    puts "Wrong credentials, try again please!"
  end

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name}, #{meal.price}€"
    end
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}, #{customer.address}"
    end
  end

  def display_orders(orders)
    orders.each do |order|
      puts "#{order.id} - delivered by #{order.employee.username} for #{order.customer.name}  - meal: #{order.meal.name}"
    end
  end
end





