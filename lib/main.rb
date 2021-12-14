module WordGenerator
  def word_generator
    f = File.open("5desk.txt", chomp: true)
    p f.readlines
  end
end

def word_generator
  b = IO.readlines("5desk.txt", chomp: true).select {|word| word.length.between?(5,12)}
  b.sample.downcase()
end

puts word_generator()
