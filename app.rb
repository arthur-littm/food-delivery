# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/session_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

customers_csv = 'data/customers.csv'
customer_repository = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repository)

meals_csv = 'data/meals.csv'
meal_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repository)

employees_csv = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employees_csv)
session_controller = SessionController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, session_controller)
router.run
