namespace :user do
  desc "TODO"
  task email: :environment do
  	@users = User.all
  	@users.each do |user|
  		UserMailer.start_email(user).deliver_now
  	end
  end
  task check_in: :environment do
  	i = Interview.where(date: Date.today)
  	u_i = []
  	users = []
  	i.each do |int|
  		u_i << UserInterview.where(interview_id: int.id)
  	end
  	u_i.each do |ui|
  		users << User.find(ui[0].user_id)
  		users << User.find(ui[1].user_id)
  	end
  	users.each do |user|
  		UserMailer.check_in(user).deliver_now
  	end
  end

end
