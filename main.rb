require_relative './computer.rb'
require_relative './player.rb'
require_relative './tools.rb'

class Game
  include Tools
  def initialize
    @computer = Computer.new
    @player = Player.new
  end
  def guess_or_create
    loop do
      puts "Would you like to play as a codemaker or a codebreaker? Enter 'maker' or 'breaker'."

      choice = gets.chomp.downcase
      until choice == 'maker' || choice == 'breaker'
        puts "Please enter 'maker' or 'breaker'"
        choice = gets.chomp.downcase
      end
      if choice == 'maker'
        player_maker_game
      else
        player_breaker_game
      end
      
      puts "Would you like to play again ? Enter Y for 'yes' and anything else for 'no'. "
      answer = gets.chomp.downcase
      unless answer == 'y' || answer == 'yes'
        puts "The game has ended. Thank you for playing! by bilguun-ocean"
        return
      end
    end
  end

  def player_maker_game
    code = @player.create_code
    i = 12
    12.times do
      if @computer.guessed_code
        puts "Computer has cracked your secret code!"
        return
      end
      puts "Computer currently has #{i} turns remaining."
      #This displays clues comparing the code computer guessing and secret code player given.
      #Also makes computer a guess with the second parameter of clue
      display_clue(clue(@computer.starting_guess, @computer.guess_code(code)))
      sleep(1)
      i -= 1
    end
  end


  def player_breaker_game
    @computer.generate_code
    for i in -12..-1
      puts "Player currently has #{i.abs} turns remaining"
      puts "Enter a 4 digit number using numbers between 1-6"
      user_input = gets.chomp.split('').map {|num| num = num.to_i}
      display_clue(clue(@computer.secret_code, user_input.join))
      if user_input.join.to_i == @computer.secret_code
        puts "You have cracked the code!"
        return
      end
    end
    puts "You could not guess the secret_code in 12 turns! The secret code was #{@computer.secret_code}"
  end

end

test = Game.new

test.guess_or_create