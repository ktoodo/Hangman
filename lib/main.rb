require_relative 'display'
require_relative 'word_generator'
require_relative 'player'
require 'yaml'

class Hangman
  attr_accessor :available_letters
  include Display
  include WordGenerator

  def initialize(guessed_letters = [], secret_word = "")
    @available_letters = ('a'..'z').to_a
    @secret_word = word_generator
    @player = Player.new()
    play_game
  end

  def play_game
    if File.exists?('saved_game.yaml')
      puts "Load an old game? y/n"
      if gets.chomp == 'y'
        file = File.open("saved_game.yaml", "r")
        saved_data = file.read
        saved_data_2 = YAML.load(saved_data)
        @player.guessed_letters = saved_data_2[:guessed_letters]
        @secret_word = saved_data_2[:secret_word]
        puts "Loaded game"
        file.close
      end
    end
    until game_won || game_lost
      play_round
    end
  end

  def play_round
    puts graphics(@player.lives(@secret_word, @player.guessed_letters))
    round_info(@secret_word, @player.guessed_letters)
    save_game
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

  def save_game
    case @player.guess_letter(@available_letters)
    when 1
      save_file = File.open("saved_game.yaml", "w")
      save_file.puts to_yaml
      save_file.close
      puts "Saved game"
    else
      puts "Continue"
    end
  end

  def to_yaml
    YAML.dump ({
      :guessed_letters => @player.guessed_letters,
      :secret_word => @secret_word
    })
  end
end

game = Hangman.new()
