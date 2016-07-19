class AddColumnsToInterviews < ActiveRecord::Migration
  def change
  	add_column :interviews, :user_3_id, :integer
  	add_column :interviews, :question_3, :string
  end
end
