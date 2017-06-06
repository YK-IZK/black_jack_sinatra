require "sinatra/base"
require "sinatra/reloader"
require "rubygems"
Dir[File.expand_path('./lib/' + '*.rb')].each{ |file| require file }


class BlackJackApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    @player = Player.new('player1')
    puts @player.name
    @dealer = Dealer.new()

    2.times do
      @player.add_hands @dealer.deal
    end

    session[:player] = @player
    session[:dealer] = @dealer

    @is_black_jack = (@player.calc_score == 21)

    erb :main
  end

  get '/hit' do
    @player = session[:player]
    @dealer = session[:dealer]

    @player.add_hands @dealer.deal

    @player = session[:player]
    @dealer = session[:dealer]

    @is_burst = (@player.calc_score > 21)

    erb :main
  end

  get '/stay' do
    @player = session[:player]
    @dealer = session[:dealer]

    erb :result
  end
end
