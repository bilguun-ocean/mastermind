class Computer

  def create_code()
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
  end

  def break_code()
    approved_list = []
    #starting guess
    guess = [1122]
    until list.length == 1
      list.each do |code|
        if clue(random_code, guess) == clue(code, guess)
          approved_list.push(code)
        end
      end
      #maybe put this in method inside class/module?
      list = approved_list.clone
      guess = list[0]
      approved_list.clear
    end
  end  

end





### This is the Donald Knuth's algorithm.
#starting guess

#generating all the possible solutions
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

##Trying out the guess code
#Eliminating any code that would not give the same clues if guess were the code.
def break_code()
  approved_list = []
  #starting guess
  guess = [1122]
  until list.length == 1
    list.each do |code|
      if clue(random_code, guess) == clue(code, guess)
        approved_list.push(code)
      end
    end
    #maybe put this in method inside class/module?
    list = approved_list.clone
    guess = list[0]
    approved_list.clear
  end
end
def swap_list(list, approved_list)
  list = approved_list.clone
  approved_list.clear
end



def convert(number)
  number = number.to_s.split("")
  number.each do |num|
    puts num
  end
end
