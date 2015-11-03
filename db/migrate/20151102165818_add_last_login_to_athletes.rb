class AddLastLoginToAthletes < ActiveRecord::Migration
  def change
    change_table :athletes do |t|
      t.datetime :last_login
      t.logins :int
    end
  end
end
