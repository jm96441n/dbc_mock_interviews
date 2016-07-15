class Upcomings < ActiveRecord::Migration
  def change
  	create_table :upcomings do |t|
  		t.date :date, null: false, unique: true
  		t.references :user, null: false
  	end
  end
end
