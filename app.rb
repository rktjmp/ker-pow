# app.rb
require 'sinatra'

get '/' do
  
  apps = Dir.entries('../').select do |entry|
    File.symlink? File.join("..", entry) and entry != "default"
  end.map {|symlink| {name: symlink, link: "http://#{symlink}.dev"}}

  erb :index, locals: {apps: apps}

end

get '/restart/:symlink' do
	FileUtils.touch("../#{params[:symlink]}/tmp/restart.txt")
	redirect to("http://#{params[:symlink]}.dev")
end