class Card
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def show
    "#{suit}#{rank}"
  end

  attr_reader :suit, :rank
end
