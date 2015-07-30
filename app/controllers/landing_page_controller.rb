get '/' do

  erb :index
end

get '/login' do
  #user check
  erb :profile
end

get '/signup' do

  erb :'user/signup'
end

