     
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

def run_sql(sql)
  conn = PG.connect(dbname: 'homey')
  result = conn.exec(sql)
  conn.close
  result
end

get '/' do
  erb :index
end

get '/properties/new' do
  erb :new_property
end

get '/properties' do
  @properties = run_sql("SELECT * FROM properties;")
  erb :properties
end

get '/properties/:id' do
  result = run_sql("SELECT * FROM properties WHERE id = #{ params[:id] };")
  @property = result.first
  erb :property_details
end

post '/properties' do
  sql = "INSERT INTO properties (description, address, image_url) VALUES ('#{ params[:desc] }', '#{ params[:address] }', '#{ params[:image_url] }');"
  run_sql(sql)

  redirect '/properties'
end

delete '/properties/:id' do
  run_sql("DELETE FROM properties WHERE id = #{ params[:id] };")
  redirect '/properties'
end

get '/properties/:id/edit' do
  sql= "SELECT * FROM properties WHERE id = #{ params[:id] };"
  @property = run_sql(sql).first
  erb :edit_property
end

put '/properties/:id' do
  sql = "update properties set description = '#{params[:desc]}', address = '#{params[:address]}', image_url = '#{params[:image_url]}' where id = #{params[:id]}"
  run_sql(sql)
  redirect "/properties/#{ params[:id] }"
end






