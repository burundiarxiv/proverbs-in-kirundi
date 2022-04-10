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
    puts "#{count} #{guess} #{proverb}"
    count += 1
    if result.key?(guess)
      result[guess] << proverb
    else
      result[guess] = [proverb]
    end
  end
end

binding.pry


  # puts count
  # if one of the words is made of 5 letters print the proverb
  # if words.any? { |word| word.length == 5 }
  #   puts "#{count} #{proverb}"
  #   count += 1
  # end
  # p words
