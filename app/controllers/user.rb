### SignIn


get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  @athlete = Athlete.create(params)
  session[:athlete] = @athlete.id
  redirect '/'
end

get '/login' do
  erb :'users/login'
end

post '/login' do

  athlete = Athlete.where(username: params[:username]).first
  if athlete && athlete.password == params[:password]
    session[:athlete] = athlete.id
  end
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
