describe Player do

  before do
    @player = Player.new('player1')
  end

  describe 'add_hands method' do
    context 'given a Card【h8】' do
      before do
        @player.add_hands Card.new('h', 8)
      end

      it 'add the Card to own hands' do
        expect(@player.hands.length).to eq(1)
      end
    end
  end

  describe 'show_hands method' do
    context 'when hands are【h8】and【c2】' do
      before do
        cards = [Card.new('h', 8), Card.new('c', 2)]
        cards.each { |hand| @player.add_hands  hand}
      end

      it 'returns string "h8,c2"' do
        expect(@player.show_hands).to eq('h8,c2')
      end
    end
  end

  describe 'calc_score method' do
    context 'when hands are【h8】and【c2】' do
      it 'returns integer 10' do
        cards = [Card.new('h', 8), Card.new('c', 2)]
        cards.each { |hand| @player.add_hands  hand}

        expect(@player.calc_score).to eq(10)
      end
    end

    context 'when hands are【hJ】and【cA】' do
      it 'returns integer 21' do
        [Card.new('h', 11), Card.new('c', 1)].each { |hand| @player.add_hands  hand}
        expect(@player.calc_score).to eq(21)
      end
    end

    context 'when hands are【cA】and【hA】' do
      it 'eturns integer 12' do
        [Card.new('h', 8), Card.new('c', 1), Card.new('h', 1)].each { |hand| @player.add_hands  hand}
        expect(@player.calc_score).to eq(20)
      end
    end
  end
end
