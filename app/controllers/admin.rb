get '/administration' do
  if session[:athlete_id] == 1
    @athlete_age_data = athlete_age_data
    erb :administration
  else
    redirect '/'
  end
end
