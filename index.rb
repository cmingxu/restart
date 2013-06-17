require 'sinatra'

set :views, File.dirname(__FILE__) + "/views"

get '/' do
  haml :index
end

post '/restart' do
  system "mysql -uroot -e 'drop database gold_fish_qa'"
  system 'cd /home/deploy/code/GoldFish && git pull origin master && cap qa deploy'
  redirect "/"
end
