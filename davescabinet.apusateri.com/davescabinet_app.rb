require 'sinatra/base'
require 'json'
require './db/connector'

#http://www.sinatrarb.com/intro

class DavesCabinetApp < Sinatra::Base
	
	enable :sessions

	configure do 
		set :root_url, "http://localhost:4567/"
		set :css_url, "http://css.apusateri.com/v2/"
		set :base_title, "Dave's Cabinet"
	end

	configure :production do
		set :root_url, "http://davescabinet.apusateri.com/"
	end

	get '/' do
		
	  erb :home
	end

	get '/api/get_quotes/:count' do
		quotes = Connector::get_database.execute "SELECT Text FROM QUOTES ORDER BY RANDOM() LIMIT #{params[:count]};";

		quote_text = [];

		quotes.each do |q|
			quote_text.push(q[0])
		end

		JSON.generate(quotes);
	end

	def get_title
		base_title = settings.base_title
		if @title.nil?
			base_title
		else
			"#{@title} | #{base_title}"
		end
	end

	run! if app_file == $0

end