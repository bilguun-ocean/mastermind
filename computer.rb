class Computer

  attr_reader :starting_guess, :list, :guessed_code
  
  def initialize
    @starting_guess = 1122
    @list = generate_list
    @guessed_code = false
  end

  def generate_code()
    @random_code = []
    for i in 1..4
      @random_code.push(rand(6) + 1)
    end
    @random_code = random_code.join.to_i
  end

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

  def guess_code(secret_code) #### Make this more compatible with the main
    puts "Computer has guessed #{starting_guess}"
    if @starting_guess == secret_code
      @guessed_code = true
    end
    single_round_guess(secret_code)
  end


  def single_round_guess(secret_code)
    approved_list = []
    @list.each do |code|
      if clue(secret_code, @starting_guess) == clue(code, @starting_guess)
        approved_list.push(code)
      end
    end
    #maybe put this in method inside class/module?
    @list = approved_list.clone
    approved_list.clear
    @starting_guess = list[0]

  end

  def clue(code, input)
    found = [0,0]
    code = code.to_s.split("")
    input = input.to_s.split("")
    code.each_with_index do |code, code_index|
      input.each_with_index do |key, key_index|
        if code == key && code_index == key_index #saving if in correct position and color
          found[0] += 1
          input[key_index] = ''
          break
        elsif code == key #saving if correct color
          found[1] += 1
          input[key_index] = ''
          break
        end
      end
    end
    found
  end

  def display_clue(clue)
    puts "#{"+" * clue[0]}#{"-" * clue[1]}"
  end
end
  
