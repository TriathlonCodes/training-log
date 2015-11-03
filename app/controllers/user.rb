### SignIn
require 'Date'

get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  @athlete = Athlete.create(params)
  session[:athlete_id] = @athlete.id
  redirect '/'
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  athlete = Athlete.where(email: params[:email]).first
  if athlete && athlete.password == params[:password]
    # p "THIS SHOULD WORK"
    session[:athlete_id] = athlete.id
    athlete.last_login = Date.today
  end
  redirect '/'
end


get '/logout' do
  session[:athlete_id] = nil
  redirect '/'
end

get '/delete-account' do
  Athlete.find(session[:athlete_id]).destroy
  redirect '/'
end
