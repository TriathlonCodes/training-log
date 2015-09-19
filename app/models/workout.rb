class Workout < ActiveRecord::Base
  # Remember to create a migration!
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
  # class

end
