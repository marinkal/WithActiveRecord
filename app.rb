#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base

end

get '/' do
  @barbers = Barber.order "created_at DESC"
	erb :index			
end


get '/visit' do
  erb :visit
end

post '/visit' do
 
  @barber = params[:barber]
  @name = params[:username]
  @phone = params[:phone]
  @date = params[:date]
  @color = params[:color]
 
  hh = {:username => 'Введите имя',:phone => 'Введите телефон',:date => 'Введите дату'}
  @error=hh.select{|key,_|params[key].strip==""}.values.join(",")
  if @error != ""
    return erb :visit 
  else 
  #f=File.open("./public/clients.txt","a")
  #f.write("#{@barber}, #{@name}, #{@phone}, #{@date}, #{@time}\n")
  #f.close
  #@db.execute 'insert into users(name,barber,phone,DateStamp,color) Values(?,?,?,?,?)',[@name,@barber,@phone,@date+' '+@time,@color]
 # @db.execute  'insert into Users(name,barber,phone,DataStamp,color) Values(?,?,?,?,?,)',[@name,@barber,@phone,@date + ' '+@time,@color]
  db = get_db
  db.execute 'insert into users(name,barber,phone,datestamp,color) Values(?,?,?,?,?)',[@name,@barber,@phone,@date,@color]
  db.close
 
  erb "Поздравляем! Вы запиисаны к парикмахеру #{@barber}, на #{@date}, вы выбрали цвет #{@color} "
  end
end
