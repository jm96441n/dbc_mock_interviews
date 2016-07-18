namespace :user do
  desc "TODO"
  task email: :environment do
  	@users = User.all
  	@users.each do |user|
  		UserMailer.start_email(user).deliver_now
  	end
  end

end
