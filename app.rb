require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	hh = { :username => 'Введите имя',
	       :phone => 'Введите телефон', 
	       :datetime => 'Укажите дату и время'}

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

	erb "Отлично! #{@username}, мастер #{@barber} будет ждать Вас #{@datetime}. Цвет краски #{@color} !
	Если что-то поменяется, мы с Вами свяжемся по телефону #{@phone}. Хорошего дня! "
end