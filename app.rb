require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/pirates/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @ship1 = Ship.new(params[:pirate][:ships][0])
      @ship2 = Ship.new(params["pirate"]["ships"][1])
      @pirate = Pirate.new(name: params["pirate"]["name"], height: params["pirate"]["height"], weight: params["pirate"]["weight"])

      erb :'pirates/show'
    end
  end
end
