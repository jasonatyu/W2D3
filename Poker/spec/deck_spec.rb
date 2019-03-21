require 'deck'

RSpec.describe Deck do 
  subject(:deck) { Deck.new }
  describe "#initialize" do 
    it "should initialize 52 unique playing cards" do 
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.uniq.length).to eq(52)
    end
    
  end
end