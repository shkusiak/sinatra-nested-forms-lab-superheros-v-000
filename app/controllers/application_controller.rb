require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      # binding.pry
      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @heros = []
      @heros_powers = []
      @heros_bios = []
      @team_members = params[:team][:members]
      # binding.pry
      @team_members.each do |hero|
        @heros << hero[:name]
        @hero_powers << hero[:power]
        @hero_bios << hero[:bio]
      end
      erb :team
    end

end
