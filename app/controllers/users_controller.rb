require 'awesome_print'

get '/' do
  if logged_in?
    redirect "/users/#{session[:id]}"
  else
    erb :'user/login'
  end
end

get '/signup' do
  erb :'user/signup'
end

#NEED MORE LOGIC FOR WHEN USER ISN'T SAVED
post '/users/new' do
  user = User.new(username: params[:username], email: params[:email])
  user.password = params[:password]
  if user.save
    set_session(user.id)
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.messages
    ap @errors
    redirect '/signup'
  end
end

get '/users/:id' do
  erb :'user/profile'
end

# get '/login' do
#   #user check
#   erb :'user/login'
# end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    set_session(user.id)
    redirect '/'
  end
end

get '/users/:id/relationships' do

  erb :'/user/relationship'
end

