describe Dealer do
  context 'when the deck is full' do

    before do
      @dealer = Dealer.new()
    end

    describe 'deal method' do
      before do
        @card = @dealer.deal
      end

      it 'returns a Card' do
        expect(@card.class).to eq(Card)
      end

      it 'decrease the number of cards in deck to 51' do
        expect(@dealer.deck.length).to eq(51)
      end
    end

    describe 'make_deck method' do
      before do
        @dealer.deal
      end

      it 'returns a cards array whose length is 52' do
        expect(@dealer.make_deck.length).to eq(52)
      end

    end
  end
end
