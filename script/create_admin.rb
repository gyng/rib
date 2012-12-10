require 'io/console'

User.transaction do
  puts 'Enter name: '
  name = gets.chomp
  puts 'Enter password: '
  password = STDIN.noecho(&:gets).chomp
  puts 'Enter password again: '
  password_confirmation = STDIN.noecho(&:gets).chomp

  user = User.new
  user.name = name
  user.password = password
  user.password_confirmation = password_confirmation
  user.save

  puts "Admin #{user.name} created. Admin count: #{User.count}"
end