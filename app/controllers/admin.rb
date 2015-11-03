get '/administration' do
  if session[:athlete_id] == 1
    erb :administration
  else
    redirect '/'
  end
end
