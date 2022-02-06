require_relative './tools.rb'

class Player
  include Tools
  attr_reader :secret_code
  def initialize
    @secret_code = 0
  end
  def create_code
    puts "Please enter a 4 digit number using numbers between 1-6"
    code = gets.chomp.split("")
    until code.all? {|code| code.to_i > 0 && code.to_i <= 6} && code.length == 4
      puts "Please enter a valid input"
      code = gets.chomp.split("")
    end
    puts "The secret code you've created is #{code.join.to_i}!"
    @secret_code = code.join.to_i
  end

  def check_input
  end
end




