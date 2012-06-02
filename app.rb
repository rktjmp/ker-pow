# app.rb
require 'sinatra'

get '/' do
  
  apps = Dir.entries('../').select do |entry|
    File.symlink? File.join("..", entry) and entry != "default"
  end.map {|symlink| {name: symlink, link: "http://#{symlink}.dev"}}

  erb :index, locals: {apps: apps}

end

get '/restart/:symlink' do
	begin
		FileUtils.touch("../#{params[:symlink]}/tmp/restart.txt")
		redirect to("http://#{params[:symlink]}.dev")
	rescue
		app = {name: params[:symlink], link: "http://#{params[:symlink]}.dev"}
		erb :restart_error, locals: {app: app}
	end
end

get '/log/:symlink' do 
	log_path = "../#{params[:symlink]}/log/development.log"
	if File.exists?(log_path)
		log_lines = `tail -n 50 #{log_path}`.lines
		@page_classes = "log"
		erb :log, locals: {log_lines: log_lines}
	else
		app = {name: params[:symlink], link: "http://#{params[:symlink]}.dev"}
		erb :log_error, locals: {app: app}
	end
end