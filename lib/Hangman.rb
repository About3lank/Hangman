# frozen_string_literal: true
require 'pry'

require_relative "Hangman/version"
module Hangman
  class Error < StandardError; end
  # Your code goes here...
end


class Round

  attr_accessor :word, :guessed

  def initialize
    puts "Round starting. Choose the word:"
    self.word = gets.chomp
    self.guessed = ['g', 'm', 'n']
  end

  def render_board
    bodies = [ "🎩    ", "🎩🙁   ", "🎩😟👕  ", "🎩😣👕👖 ", "🎩😣🙏👖 ", "🎩😵🧥👖🧦"]
    attempts = self.guessed.length

    if attempts > 0
      body = bodies[attempts - 1]
    else
      body = [""]*6
    end

    reveal = ""
    self.word.length.times { |i| (self.guessed.include? self.word[i]) ? reveal += "#{self.word[i]} " : reveal += "_ " }

    guess_str = ""
    self.guessed.each { |i| guess_str += "#{i} " }

    puts ""
    puts "         #####################"
    puts "         #####################"
    puts "         ####           ####"
    puts "         ####           ####"
    5.times { |i| puts "         ####            #{body[i]}" }
    puts "         ####                            #{reveal}"
    puts "         ####"
    puts "         ####                            #{6 - self.guessed.length}/6 Guesses Remaining"
    puts "  #################################       << #{guess_str} >>"
    puts ""

  end

end

binding.pry











