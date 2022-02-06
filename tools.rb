module Tools
  def clue(code, input)
    found = [0,0]
    code = code.to_s.split("")
    input = input.to_s.split("")
    code.each_with_index do |code, code_index|
      input.each_with_index do |key, key_index|
        if code == key && code_index == key_index
          found[0] += 1
          input[key_index] = ''
          break
        elsif code == key
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

  def check_input(input)
    input = input.to_s.split("")
    input.all? {|input| input.to_i > 0 && input.to_i <= 6} && input.length == 4
  end
end