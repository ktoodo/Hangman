module WordGenerator
  def word_generator
    IO.readlines("5desk.txt", chomp: true).select {|word| word.length.between?(5,12)}.sample.downcase()
  end
end

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

#make guesses
class Player
  attr_accessor :guessed_letters

  def initialize
    @guessed_letters = []
  end

  def guess_letter(available_letters)
    puts "\nGuess a letter"
    letter = gets.chomp.downcase
    if @guessed_letters.include?(letter)
      guess_letter(available_letters)
    elsif available_letters.include?(letter)
      @guessed_letters += [letter]
    else
      guess_letter(available_letters)
    end
  end

  def lives(secret_word, guessed_letters)
    incorrect = guessed_letters.reject { |letter| secret_word.include?(letter)}
    incorrect.length
  end
end

#evaluate guess and go through game
class Hangman
  include Display, WordGenerator
  attr_accessor :available_letters

  def initialize
    @available_letters = ('a'..'z').to_a
    @secret_word = word_generator
    @player = Player.new()
    play_game
  end

  def play_game
    until game_won || game_lost
      play_round
    end
  end

  def play_round
    puts graphics(@player.lives(@secret_word, @player.guessed_letters))
    round_info(@secret_word, @player.guessed_letters)
    p @secret_word
    @player.guess_letter(@available_letters)
  end

  def game_won
    if @secret_word.split("").all? {|letter| @player.guessed_letters.include?(letter)}
      puts "You won, the word was '#{@secret_word}'"
      true
    else
      false
    end
  end

  def game_lost
    if @player.lives(@secret_word, @player.guessed_letters) == 6
      puts graphics(@player.lives(@secret_word, @player.guessed_letters))
      return true
    else
      false
    end
  end
end

game = Hangman.new()
