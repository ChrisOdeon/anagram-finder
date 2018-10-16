require 'open-uri'

wordlist_file = "https://gist.githubusercontent.com/Kalagan/3b26be21cbf65b62cf05ab549433314e/raw/1d897c6aa189959fa708fadce75ad43c26c7a6b1/wordlist.txt"

puts "deleting old words"
Wordlist.delete_all

puts "opening '#{wordlist_file}"
open(wordlist_file) do |words|
  puts "file opened"
  words.read.each_line do |word|
    puts "read: #{word}"
    chomped_word = word.chomp
    sorted_word = chomped_word.chars.sort.join
    puts "creating -> #{chomped_word}"
    Wordlist.create!(word: chomped_word, sorted_word: sorted_word)
  end
end