namespace :user do
  desc "TODO"
  task email: :environment do
  	@users = User.all
  	@users.each do |user|
  		UserMailer.start_email(user)
  	end
  end

end
