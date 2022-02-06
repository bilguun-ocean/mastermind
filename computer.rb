require_relative './tools.rb'

class Computer
  include Tools
  attr_reader :starting_guess, :list, :guessed_code, :secret_code
  
  def initialize
    @starting_guess = 1122
    @list = generate_list
    @guessed_code = false
    @secret_code = []
  end

  #This creates a random code for user to break 
  def generate_code()
    for i in 1..4
      @secret_code.push(rand(6) + 1)
    end
    @secret_code = @secret_code.join.to_i
  end

  #This generates all possible solution
  def generate_list()
    list = []
    for a in 1..6
      for b in 1..6
        for c in 1..6
          for d in 1..6
            list.push((a.to_s + b.to_s + c.to_s + d.to_s).to_i)
          end
        end
      end
    end
    list
  end
  #This method makes a single guess
  def guess_code(secret_code)
    puts "Computer has guessed #{starting_guess}"
    if @starting_guess == secret_code
      @guessed_code = true
    end
    single_round_guess(secret_code)
  end

  #This method filters down the "could be" answers
  def single_round_guess(secret_code)
    approved_list = []
    @list.each do |code|
      if clue(secret_code, @starting_guess) == clue(code, @starting_guess)
        approved_list.push(code)
      end
    end
    @list = approved_list.clone
    approved_list.clear
    @starting_guess = list[0]

  end
end
  
