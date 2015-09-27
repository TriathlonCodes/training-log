require 'bcrypt'
class Athlete < ActiveRecord::Base
  # Remember to create a migration!
  has_many :workouts
  validates :username, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create(params)
    athlete = Athlete.new(params[:athlete])
    athlete.password = params[:password]
    athlete.save!
    return athlete
  end
end
