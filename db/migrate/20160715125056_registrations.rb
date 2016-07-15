class Registrations < ActiveRecord::Migration
  def change
  	create_table :registrations do |t|
  		t.date :date, null: false
  		t.references :user, null: false
  	end
  end
end
