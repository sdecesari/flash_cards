require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end
  it "exists" do
    expect(@deck).to be_a Deck
  end

  it "can count total cards" do
    expect(@deck.count).to eq 3
  end

  it "can list cards in a given category" do
    expect(@deck.cards_in_a_category(:STEM)).to eq [@card_2, @card_3]
    expect(@deck.cards_in_a_category(:Geography)).to eq [@card_1]
    expect(@deck.cards_in_a_category("Pop Culture")).to eq []
  end
end
