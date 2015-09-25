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
    selected = Workout.order(date: :asc, id: :desc)
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
  def self.cumulative(year)
    workouts_to_accumulate= Workout.workouts_from_year(year).order(date: :asc, id: :desc)
    p workouts_to_accumulate
    @run_accumulation_hash = {}
    run_accumulator = 0
    @swim_accumulation_hash = {}
    swim_accumulator = 0
    @bike_accumulation_hash = {}
    bike_accumulator = 0
    # return workouts_to_accumulate
    workouts_to_accumulate.each do |workout|
      run_accumulator += workout.run.round(2)
      @run_accumulation_hash[workout[:date]] = run_accumulator
      swim_accumulator += workout.swim.round(2)
      @swim_accumulation_hash[workout[:date]] = swim_accumulator
      bike_accumulator += workout.bike.round(2)
      @bike_accumulation_hash[workout[:date]] = bike_accumulator
    end
    return {"run"=> @run_accumulation_hash, "bike"=> @bike_accumulation_hash, "swim"=> @swim_accumulation_hash}
  end
end












