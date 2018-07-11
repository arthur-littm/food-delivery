require_relative "../views/view"

class SessionController
  def initialize(employee_repository)
    @view = View.new
    @employee_repository = employee_repository
  end

  def sign_in
    # ask for username / password
    username = @view.ask_for("username")
    password = @view.ask_for("password")
    # find the employee based on username and see if password match
    employee = @employee_repository.find_by_username(username)
    # if yes continue
    if employee && employee.password == password
      @view.welcome
      return employee
    else
      print `clear`
      @view.unsuccessful_credentials
      sign_in
    end
    # if no ask again for login
  end
end
