  require_relative "card"

class Deck
  attr_reader :cards

  # SUITS = [9829, 9824, 9827, 9830].pack('U*')
  SUITS = %w(H S C D)
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def initialize 
    @cards = populate
  end

  def populate
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards
  end

end