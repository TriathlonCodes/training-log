class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.date :birthday
      t.string :password_hash
      t.timestamps(null: false)
    end
  end
end
