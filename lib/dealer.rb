CARD_INFO = {
  suits: ['h', 's', 'd', 'c'],
  numbers: (1..13).to_a
}

class Dealer
  def initialize
    @deck = make_deck
  end

  # returns a card on the top of the deck and delete it from the deck
  def deal
    @deck.shift
  end

  def make_deck
    deck = []

    # make a deck
    CARD_INFO[:suits].each do |suit|
      CARD_INFO[:numbers].each do |numbers|
        deck << Card.new(suit, numbers)
      end
    end

    deck.shuffle!
  end

  attr_reader :deck
end
