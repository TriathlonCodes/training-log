### SignIn

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  athlete = Athlete.find_by(athlete: params[:athlete])
  if athlete && athlete.password == params[:password]
    session[:athlete] = athlete.id
  end
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @athlete = Athlete.create(params)
  session[:athlete] = @athlete.id
  redirect '/'
end

get '/logout' do
  session[:athlete] = nil
  redirect '/'
end

get '/delete-account' do
  Athlete.find(session[:athlete]).destroy
  redirect '/'
end
