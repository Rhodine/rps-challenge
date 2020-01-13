require 'sinatra/base'
require './lib/player'

class Rps < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $computer = Player.new(params[:computer])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player_1.name
    @computer = $computer.name
    erb :play
  end

  post '/rps' do
    session[:rps] = params[:rps]
    redirect '/choose_rps'
  end

  get '/choose_rps' do
    @player_1_name = $player_1.name
    @computer = $computer.name
    @rps = session[:rps]
    erb :choose_rps
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
