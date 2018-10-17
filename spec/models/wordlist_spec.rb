require 'rails_helper'

RSpec.describe Wordlist, type: :model do
  before :each do
    words = [
      'crepitus',
      'piecrust',
      'pictures',
      'cuprites',
      'tepas',
      'tapes',
      'enlist',
      'tinsel'
    ]

    words.each do |word|
      Wordlist.create(word: word)
    end
  end

  context 'I request an anagram for a word that has anagrams' do
    it 'should return anagrams for the word' do
      result = Wordlist.find_anagrams("crepitus")
      expect(result.to_json).to eq({"crepitus":["piecrust", "pictures", "cuprites"]}.to_json)
    end
  end

  context 'I request an anagram for a multiple words that have anagrams' do
    it 'should return anagrams for all the words' do
      result = Wordlist.find_anagrams("crepitus,tepas,enlist")
      expect(result.to_json).to eq({
        "crepitus":["piecrust", "pictures", "cuprites"],
        "tepas": ['tapes'],
        "enlist": ["tinsel"]
      }.to_json)
    end
  end

  context 'I request an anagram for a word that has no anagrams' do
    it 'should return no results for the word' do
      result = Wordlist.find_anagrams("testword")
      expect(result.to_json).to eq({"testword":[]}.to_json)
    end
  end
end
