Rails.application.routes.draw do
  get "/:word_query", to: "wordlist#anagrams"
end
