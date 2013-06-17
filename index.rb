require 'sinatra'

set :views, File.dirname(__FILE__) + "/views"

get '/' do
  haml :index
end

post '/restart' do
  system 'cd /home/deploy/code/GoldFish && git pull origin master && cap deploy'
  redirect "/"
end
