require_relative './computer.rb'
require_relative './player.rb'

class Game
  def initialize
    @computer = Computer.new
    @player = Player.new
  end
  def guess_or_create
    puts "Hello! Would you like to play as a codemaker or a codebreaker? Enter 'maker' or 'breaker'."

    answer = gets.chomp.downcase
    until answer == 'maker' || answer == 'breaker'
      puts "Please enter 'maker' or 'breaker'"
      answer = gets.chomp.downcase
    end
    if answer == 'maker'
      player_maker_game
    else
      player_breaker_game
    end
  end

  def player_maker_game ##### Fix thi==
    code = @player.create_code
    i = 12
    12.times do
      #Don't try to break if found the code
      if @computer.guessed_code
        puts "Computer has cracked your secret code!"
        return
      end
      puts "Computer currently has #{i} turns remaining."
      @computer.guess_code(code)
      i -= 1
    end
  end


  end

  def player_breaker_game
  end

  def display_clue(clue)
    puts "#{"+" * clue[0]}#{"-" * clue[1]}"
  end

test = Game.new

test.guess_or_create