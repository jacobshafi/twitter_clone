get '/login' do
  #user check
  erb :profile
end

get '/signup' do

  erb :'user/signup'
end

post '/users/new' do
  user = User.new(username: params[:username], email: params[:email])
  user.password = params[:password]
  user.save
  p user.errors
  p "paraaaaaams: #{params}"
  set_session(user.id)
  redirect "/users/#{user.id}"
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user.password == params[:password]
    set_sessin(user.id)
    redirect '/profile'
  else
    redirect '/'
  end
end



