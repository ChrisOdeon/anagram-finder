class Wordlist < ApplicationRecord
  before_validation :set_sorted_word
  validates_presence_of :word, :sorted_word

  def self.find_anagrams(word_query)
    return_hash = Hash.new

    word_query.split(',').uniq.each do |word_request|
      sorted_word_request = word_request.chars.sort.join
      @words = Wordlist.where(sorted_word: sorted_word_request)
      @words = @words.select{ |word| word.word != word_request }
      return_hash[word_request] = @words.map{ |word| word.word }
    end
    
    return_hash
  end

  private

  def set_sorted_word
    self.sorted_word = self.word.chars.sort.join
  end
end