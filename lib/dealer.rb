CARD_INFO = {
  suits: ['h', 's', 'd', 'c'],
  numbers: (1..13).to_a
}

class Dealer
  def initialize
    @deck = []

    # make a deck
    CARD_INFO[:suits].each do |suit|
      CARD_INFO[:numbers].each do |numbers|
        @deck << Card.new(suit, numbers)
      end
    end

    # shuffle the deck
    @deck.shuffle!
  end

  # returns a card on the top of the deck and delete it from the deck
  def deal
    @deck.shift
  end

  attr_reader :deck
end
