namespace :interview do
  desc "TODO"
  task Make: :environment do
  	if Date.today.strftime("%A") == "Sunday" || Date.today.strftime("%A") == "Tuesday"
			@upcomings = Upcoming.where("date = ?", Date.today + 2)
			users = []
			@upcomings.each do |up|
				users << up.user_id
			end
			until users.length == 0
				question_1 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization" => ENV['CODEWARS_KEY']},
						data: {"strategy" => "random"}
						)
				question_2 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization" => ENV['CODEWARS_KEY']},
						data: {"strategy" => "random"}
						)
				question_1 = question_1["description"]
				question_2 = question_2["description"]	
				if users.length == 3
					question_3 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization" => ENV['CODEWARS_KEY']},
						data: {"strategy" => "random"}
						)
					question_3 = question_3['description']
					i = Interview.new( 
						question_1: 'question_1',
						question_2: 'question_2',
						question_3: 'question_3',
						date: Date.today + 2
						)
					i.save
					users.each do |u|
						UserInterview.create(
							user_id: u,
							interview_id: i.id
							)
					end
					user_1 = User.find(user_1)
					user_2 = User.find(user_2)
					user_3 = User.find(user_3)
					UserMailer.interview_3_email(user_1, user_2, user_3, question_1).deliver_now
					UserMailer.interview_3_email(user_2, user_3, user_1, question_2).deliver_now
					UserMailer.interview_3_email(user_3, user_1, user_2, question_3).deliver_now

					users = []
				else
					user_1 = users.sample
					users.delete(user_1)

					user_2 = users.sample
					users.delete(user_2)

					i = Interview.new(
						question_1: 'question_1',
						question_2: 'question_2',
						date: Date.today + 2
						)
					i.save
					UserInterview.create(
						user_id: user_1,
						interview_id: i.id
						)
					UserInterview.create(
						user_id: user_2,
						interview_id: i.id
						)
					user_1 = User.find(user_1)
					user_2 = User.find(user_2)
					UserMailer.interview_email(user_1, user_2, question_1).deliver_now
					UserMailer.interview_email(user_2, user_1, question_2).deliver_now
				end
			end
		end
  end

end
