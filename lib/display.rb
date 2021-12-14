module Display
  def hidden_word(secret_word, guessed_letters)
    displayed_word = ""
    secret_word.split("").each do |letter|
      if guessed_letters.include?(letter)
        displayed_word << " #{letter} "
      else
        displayed_word << " _ "
      end
    end
    displayed_word
  end

  def round_info(secret_word, guessed_letters)
    puts "\nWord to guess: #{self.hidden_word(secret_word, guessed_letters)}"
    puts "Incorrect letters: #{(guessed_letters - secret_word.split("")).join(", ")}"
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
