class WordlistController < ApplicationController
  def anagrams
    render json: Wordlist.find_anagrams(wordlist_params[:word_query])
  end

  private
  
  def wordlist_params
    params.permit(:word_query)
  end
end