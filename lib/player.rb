class Player
  attr_accessor :guessed_letters

  def initialize
    @guessed_letters = []
  end

  def guess_letter(available_letters)
    puts "\nGuess a letter, or press 1 to save game"
    letter = gets.chomp.downcase
    if letter === '1'
      1
    elsif @guessed_letters.include?(letter)
      guess_letter(available_letters)
    elsif available_letters.include?(letter)
      @guessed_letters += [letter]
    else
      guess_letter(available_letters)
    end
  end

  def lives(secret_word, guessed_letters)
    incorrect = guessed_letters.reject { |letter| secret_word.include?(letter) }
    incorrect.length
  end
end
