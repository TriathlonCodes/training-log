class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :email
      t.integer :birthyear
      t.string :password_hash
      t.timestamps(null: false)
    end
  end
end
