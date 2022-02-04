random_code = []

for i in 1..4
  random_code.push(rand(6)+ 1)
end


#v2
def number_of_correct_colors(code, input)
  found = [0,0]
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
  unless clue.empty?
    puts "#{"-" * clue[0]}#{"+" * clue[1]}"
  end
end

def is_code_cracked?(code, input)
end

### Game starts here
## I could add these game details in loop to make it easier to play again.
#Describes the clues
puts "'-' is a clue which means correct color but not in the correct position"
puts "'+' is a clue which means correct color and in the correct position"

#Lets player to choose which to play maker or breaker
puts "\nWould you like to be a code maker or a breaker? Enter 1 for maker, 2 for breaker."
user_choice = gets.chomp.to_i

if user_choice == 2
for i in 1 .. 12
  puts "Enter a 4 digit number between 1-6"
  user_input = gets.chomp.split('').map {|num| num = num.to_i}
  if user_input == random_code
    puts "You have cracked the code!"
    break
  else
    display_clue(number_of_correct_colors(random_code, user_input))
  end
  puts "You have #{12 - i} turns remaining."
end


