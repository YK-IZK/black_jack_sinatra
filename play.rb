Dir[File.expand_path('./lib/' + '*.rb')].each{ |file| require file }

def main
  player = Player.new('player1')
  dealer = Dealer.new()

  puts "===== PHASE 1 : INITIAL DEAL ====="
  puts "deal two cards to #{player.name}"
  2.times do
    player.add_hands dealer.deal
  end

  puts "#{player.name}'s hands【#{player.show_hands}】"
  puts "(score : #{player.calc_score})"

  puts "\n===== PHASE 2 : HIT OR STAY ====="

  key = ""
  loop do
    print "HIT or STAY? (h: HIT, s: STAY) : "

    case gets.chomp
    when 'h'
      player.add_hands dealer.deal
      score = player.calc_score
      if score > 21
        puts "\n < BURST!!! > "
        break
      end

      puts "#{player.name}'s hands【#{player.show_hands}】"
      puts "(score : #{player.calc_score})"
    when 's'
      break
    end
   end

   puts "\n===== PHASE 3 : RESULTS ====="
   puts "#{player.name}'s hands【#{player.show_hands}】"
   puts "(score : #{player.calc_score})"
end

main
