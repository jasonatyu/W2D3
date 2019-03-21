require_relative 'card'
require 'byebug'

class Hand 

  attr_reader :value_freqs, :rank, :cards

  VALUE_ORDER = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]


  def initialize(*cards)
    @cards = cards
    cards.sort_by! { |card| VALUE_ORDER.index(card.value) }
    @value_freqs = get_value_freqs
    @rank = nil 
  end

  def rank
    if is_straight_flush?
      return 1 
    elsif is_four_of_kind?
      return 2 
    elsif is_full_house?
      return 3
    elsif is_flush?
      return 4
    elsif is_straight?
      return 5
    elsif is_three_of_kind?
      return 6
    elsif is_two_pair?
      return 7
    elsif is_one_pair?
      return 8
    elsif is_high_card?
      return 9
    end
  end

  def get_value_freqs
    freq_hash = Hash.new(0)
    cards.each { |card| freq_hash[card.value] += 1 }
    freq_hash
  end

  def is_flush?
    cards.uniq { |card| card.suit }.length == 1
  end

  def is_straight?
    (0...cards.length - 1).each do |i|
      return false if VALUE_ORDER.index(cards[i+1].value) != VALUE_ORDER.index(cards[i].value) + 1
    end
    true 
  end

  def is_straight_flush?
    is_straight? && is_flush?
  end

  def is_four_of_kind?
    value_freqs.values.include?(4)
  end

  def is_full_house?
    value_freqs.values.include?(3) && value_freqs.values.include?(2)
  end

  def is_three_of_kind?
    value_freqs.values.include?(3) && !value_freqs.values.include?(2)
  end

  def is_two_pair?
    value_freqs.values.count { |freq| freq == 2 } == 2
  end

  def is_one_pair?
    value_freqs.values.count { |freq| freq == 2 } == 1 && !is_two_pair? && !is_full_house?
  end

  def is_high_card?
    !is_flush? && !is_straight && cards.uniq.length == 5
  end

end

card1 = Card.new("H", "K")
card2 = Card.new("H", "J")
card3 = Card.new("H", "2")
card4 = Card.new("H", "6")
card5 = Card.new("H", "Q")
h = Hand.new(card1, card2, card3, card4, card5)
p h.rank