class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :username
      t.string :name
      t.integer :birthyear
      t.string :password_hash
      t.timestamps(null: false)
    end
  end
end
