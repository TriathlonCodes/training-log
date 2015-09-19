helpers do
  def get_last_workout
    Workout.order(year: :desc, month: :desc, day: :desc).first
  end

  def current_workout
    Workout.where(id: params[:id]).first
  end
end
