class Interviews < ActiveRecord::Migration
  def change
  	create_table :interviews do |t|
  		t.integer :user_1, null: false, index: true
  		t.integer :user_2, null: false, index: true
  		t.date :date, null: false, index: true
  		t.string :question_1, null: false
  		t.string :question_2, null: false
  	end
  end
end
