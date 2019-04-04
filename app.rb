require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      "Welcome to the Nested Forms Lab!"
    end

    get '/new' do

      erb :"pirates/new"
    end

    post '/pirates' do
      # params
      # binding.pry
      @name = params[:pirate][:name]
      @weight = params[:pirate][:weight]
      @height = params[:pirate][:height]

      @pirate = Pirate.new(@name,@weight,@height)

      params[:pirate][:ships].each_with_index do |ship_info, i|
        # binding.pry
        Ship.new(params[:pirate][:ships][i][:name],params[:pirate][:ships][i][:type],params[:pirate][:ships][i][:booty])
      end

      erb :"pirates/show"
    end
  end
end
