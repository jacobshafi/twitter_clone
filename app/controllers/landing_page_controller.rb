get '/' do
  if logged_in?
    redirect :'/users/:id'
  else
    erb :'user/login'
  end
end

# get '/login' do
#   #user check
#   erb :profile
# end

# get '/signup' do

#   erb :'user/signup'
# end

