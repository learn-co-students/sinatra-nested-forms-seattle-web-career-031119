require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      p_name = params["pirate"]["name"]
      p_height = params["pirate"]["height"]
      p_weight = params["pirate"]["weight"]

      s1_name = params[:pirate][:ships][0]["name"]
      s1_type = params[:pirate][:ships][0]["type"]
      s1_booty = params[:pirate][:ships][0]["booty"]

      s2_name = params[:pirate][:ships][1]["name"]
      s2_type = params[:pirate][:ships][1]["type"]
      s2_booty = params[:pirate][:ships][1]["booty"]

      @ship1 = Ship.new(name: s1_name, type: s1_type, booty: s1_booty)
      @ship2 = Ship.new(name: s2_name, type: s2_type, booty: s2_booty)
      @pirate = Pirate.new(name: p_name, height: p_height, weight: p_weight)
      
      # @ship1 = Ship.new(params["pirate"]["ships"][0])
      # @ship2 = Ship.new(params["pirate"]["ships"][1])
      # @pirate = Pirate.new(name: params["pirate"]["name"], height: params["pirate"]["height"], weight: params["pirate"]["weight"])

      erb :'pirates/show'
    end
  end
end
