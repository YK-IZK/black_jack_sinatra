describe Card do
  context 'when suit is "h" and mark is 1' do
    before do
      @card = Card.new('h', 1)
    end

    describe 'show method' do
      it 'returns string "h1"' do
        expect(@card.show).to eq "h1"
      end
    end
  end
end
