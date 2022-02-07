require_relative './main.rb'

def introduction
  puts <<-Introduction
  #{greet} Welcome to the Mastermind!

  Mastermind is a game where you break secret codes. 

  In this implementation, you play either as code-maker or as a code-breaker
  and the computer takes on the other side.

  As a code-maker you make a 4 digit secret code for computer to guess. (Note that the computer is
  really good!)

  As a code-breaker you get to find out the secret code that computer made
  within 12 turns. On each turn there will be "clues" as a feedback for your guess
  to guide you in the right direction. 

  Clues - Clues will be either blank, or "+" or "-".
  "+" means one of your digit in your code was correct digit in the secret code and in the corresponding position.
  4 "+" means you have cracked the code!
  "-" means one of your digit was correct digit but placed in wrong position. 
  Blank means neither, or your digit was not in the secret code.

  So goodluck and have fun! 

  -by bilguun-ocean
Introduction
end

def greet
  current_time = Time.new.hour
  if current_time.between?(5,11)
    "Good Morning!"
  elsif current_time.between?(12,18)
    "Good Afternoon"
  elsif current_time.between?(19, 22)
    "Good Evening!"
  else
    "Hello night owl!"
  end
end

introduction
puts "Press Enter to continue."
gets

start_game = Game.new

start_game.guess_or_create