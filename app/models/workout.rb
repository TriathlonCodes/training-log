class Workout < ActiveRecord::Base

  validates :date, presence: true

    def has_workout_data?
    if self["run"] != 0.0 || self["bike"] != 0.0 || self["swim"] != 0 || self["description"] != nil
      true
    else
      false
    end
  end
end
