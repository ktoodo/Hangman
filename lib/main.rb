module WordGenerator
  def word_generator
    IO.readlines("5desk.txt", chomp: true).select {|word| word.length.between?(5,12)}.sample.downcase()
  end
end

#evaluate guess and go through game
class Hangman
  def initialize
    
  end
end

#make guesses
class Player
  def initialize
    
  end
end

#display state
class Display
  def initialize
    
  end

  def round_info()
    puts "\nWord to guess: "
    puts "Incorrect letters: "
    puts "Letters to choose from: "
  end

  def graphics(incorrect)
    case incorrect
    when 0
      %(
        ____
        |   |
            |
            |
            |
       _____|
     )
    when 1
      %(
        ____
        |   |
        O   |
            |
            |
       _____|
     )
    when 2
      %(
        ____
        |   |
        O   |
        |   |
            |
       _____|
     )
    when 3
      %(
        ____
        |   |
       \\O   |
        |   |
            |
       _____|
     )
    when 4
      %(
        ____
        |   |
       \\O/  |
        |   |
            |
       _____|
     )
    when 5
      %(
        ____
        |   |
       \\O/  |
        |   |
       /    |
       _____|
     )
    when 6
      %(
        ____
        |   |
       \\O/  |
        |   |
       / \\  |
       _____|
     ) 
    end
  end
end

hangman = Display.new
for i in 0..7 do
  puts hangman.graphics(i)
end

