require 'pry'
require 'csv'
require 'date'
# require_relative 'convert_date'
require 'roo'

class Workout < ActiveRecord::Base
  belongs_to :athlete
  validates :date, presence: true

  before_save :validate_times, :set_distances

  def set_distances
    if self.run
      self.run = self.run.round(1)
    else
      self.run = 0.0
    end
    if self.bike
      self.bike = self.bike.round(1)
    else
      self.bike = 0.0
    end
    unless self.swim
      self.swim = 0
    end
  end

  def validate_times
    p "&"*70
    hours = self.duration_hours
    minutes = self.duration_minutes
    seconds = self.duration_seconds
    sleep = self.hours_sleep
    if hours
      valid = hours >= 0
    end
    if minutes
      valid = minutes >= 0 && minutes <= 60
    end
    if seconds
      valid = seconds >=0 && seconds <= 60
    end
    if sleep
      valid = sleep >= 0
    end
    return valid
  end

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
    if params[:sport] != ""
      sport = params[:sport]
      boolean = params[:boolean]
      if params[:boolean] != "" && params[:distance] != 0.0
        selected_sport = Workout.where("#{sport} #{boolean} ?", params[:distance])
      else
        selected_sport = Workout.where(sport + " != 0")
      end
      selected = selected & selected_sport
    end
    # return selected_month & selected_year
    return selected.select {|workout| workout.has_workout_data?}
  end

  def self.workouts_from_year(year)
    Workout.where("date >= ?", "#{year}-01-01").where("date <= ?", "#{year}-12-31").order(date: :asc, id: :desc)
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










