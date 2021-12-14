module WordGenerator
  def word_generator
    IO.readlines("5desk.txt", chomp: true).select { |word| word.length.between?(5, 12) }.sample.downcase()
  end
end
