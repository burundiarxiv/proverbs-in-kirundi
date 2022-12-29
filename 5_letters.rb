# frozen_string_literal: true

require 'csv'
require 'pry'

proverbs = File.read('imigani.txt').split("\r\n")

count = 1
result = {}
proverbs.each do |proverb|
  words = proverb.downcase.scan(/[a-z]*/)
  guesses = []
  words.each do |word|
    guesses << word if word.length == 5
  end

  next unless guesses.length.positive?

  guesses.each do |guess|
    # puts "#{coeaneaneaunt} #{guess} #{proverb}"
    count += 1
    if result.key?(guess)
      result[guess] << proverb
    else
      result[guess] = [proverb]
    end
  end
end

puts result

# binding.pry
