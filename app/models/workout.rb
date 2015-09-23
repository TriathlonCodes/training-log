require 'pry'
class Workout < ActiveRecord::Base

  validates :date, presence: true

  def has_workout_data?
    if self["run"] != 0.0 || self["bike"] != 0.0 || self["swim"] != 0 || self["description"] != nil
      true
    else
      false
    end
  end

  def self.search_by(params)
    # binding.pry
    selected = Workout.all
    if params[:year] != ""
      selected_year = workouts_from_year(params[:year])
      selected = selected & selected_year
    end
    # p params[:intensity]
    if params[:intensity] != ""
      selected_intensity = Workout.where(intensity: params[:intensity])
      selected = selected & selected_intensity
      # binding.pry
    end
    if params[:month] != ""
      selected_month = workouts_from_month(params[:month])
      selected = selected & selected_month
    end
    # return selected_month & selected_year
    return selected.select {|workout| workout.has_workout_data?}
  end

  def self.workouts_from_year(year)
    Workout.where("date >= ?", "#{year}-01-01").where("date <= ?", "#{year}-12-31")
  end

  def self.workouts_from_month(month)
    selected = []
    Workout.all.each {|workout|
      if workout.date.month == month.to_i
        selected << workout
      end
    }
    return selected
  end
end
