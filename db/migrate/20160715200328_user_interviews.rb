class UserInterviews < ActiveRecord::Migration
  def change
  	create_table :user_interviews do |t|
  		t.references :interview, null: false
  		t.references :user, null: false
  	end
  end
end
