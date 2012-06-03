# app.rb
require 'sinatra'

get '/' do
  
  apps = Dir.entries('../').select do |entry|
  	filter = ["..", ".", "default"]
	full_path = File.join("..", entry)
    (File.symlink?(full_path) || File.directory?(full_path)) && (not filter.include?(entry))
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