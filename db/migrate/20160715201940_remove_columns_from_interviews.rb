class RemoveColumnsFromInterviews < ActiveRecord::Migration
  def change
  	remove_column :interviews, :user_1_id, :integer
  	remove_column :interviews, :user_2_id, :integer
  	remove_column :interviews, :user_3_id, :integer
  end
end
