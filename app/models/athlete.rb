require 'bcrypt'
class Athlete < ActiveRecord::Base
  # Remember to create a migration!
  has_many :workouts
  validates :email, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create(params)
    athlete = Athlete.new(params[:athlete_id])
    athlete.password = params[:password]
    if athlete.save!
      return athlete
    else
      redirect '/signup'
    end
  end
end
