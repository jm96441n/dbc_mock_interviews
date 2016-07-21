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
  	p u_i
  end

end
