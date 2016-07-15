class Interview < ActiveRecord::Base

	has_many :user_interviews
	has_many :users, through: :user_interviews
	validates :date, :question_1, :question_2, presence: true

	def make_the_interview
		if Date.today.strftime("%A") == "Sunday" || Date.today.strftime("%A") == "Tuesday"
			@upcomings = Upcoming.where("date = ?", Date.today + 2)
			users = []
			@upcomings.each do |up|
				users << up.user_id
			end
			until users.length == 0
				question_1 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization": ENV['CODEWARS_KEY']},
						data: {"strategy": "random"}
						)
				question_2 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization": ENV['CODEWARS_KEY']},
						data: {"strategy": "random"}
						)
				question_1 = question_1["description"]
				question_2 = question_2["description"]	
				if users.length == 3
					question_3 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization": ENV['CODEWARS_KEY']},
						data: {"strategy": "random"}
						)
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
							interview: i.id
							)
					end
					users = []
				else
					user_1 = users.sample
					users.delete[user_1]

					user_2 = users.sample
					users.delete[user_2]

					i = Interview.new(
						question_1: 'question_1',
						question_2: 'question_2',
						date: Date.today + 2
						)
					i.save
					UserInterview.create(
						user_id: user_1,
						interview: i.id
						)
					UserInterview.create(
						user_id: user_2,
						interview: i.id
						)
				end
			end
		end
	end

end