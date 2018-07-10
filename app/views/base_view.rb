class BaseView
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
end
