require "card"

RSpec.describe Card do  
  subject(:card) { Card.new("Hearts", "K") }
  describe "#initialize" do  
    it "should set @suit to suit and @value to value" do 
      expect(card.suit).to eq("Hearts")
      expect(card.value).to eq("K")
    end
  end
end