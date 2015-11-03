class AddLastLoginToAthletes < ActiveRecord::Migration
  def change
    change_table :athletes do |t|
      t.date :last_login
    end
  end
end
