class GamesController < ApplicationController
  require 'json'
  require 'open-uri'

  def new
      @letters = (Array.new(10) { ('A'..'Z').to_a.sample })
  end

  score = def score
    if all_letters_are_included_in_array?
      if is_an_english_word?
        @score = "yeh"
      else
        @score = "not an english word. Score 0"
      end
    else
       @score =  "wrong letters. Score 0"
    end

    # check all letter are included continue
    # check if the word is an english one
    # calculate and return score
  end

  private


  def all_letters_are_included_in_array?
    answer = params[:answer].upcase
    letters = params[:letters]
    answer_array = answer.split('')
    letters_array = letters.split('')

    answer_array.all? do |letter|
      letters_array.include?(letter)
    end
  end

  def is_an_english_word?
    answer = params[:answer]
    url = URI.open"https://wagon-dictionary.herokuapp.com/#{answer}"
    results = JSON.parse(url.read)
    results['found']
  end

end
