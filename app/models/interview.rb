class Interview < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"
	belongs_to :user_3, class_name: "User"

	validates :user_1_id, :user_2_id, :date, :question_1, :question_2, presence: true

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
					user_1 = users[0]
					user_2 = users[1]
					user_3 = users[2]
					users.delete_at(2)
					users.delete_at(1)
					users.delete_at(0)

					question_3 = HTTParty.post(
						'https://www.codewars.com/api/v1/code-challenges/ruby/train',
						headers: {"Authorization": ENV['CODEWARS_KEY']},
						data: {"strategy": "random"}
						)
					i = Interview.new( 
						user_1_id: user_1,
						user_2_id: user_2,
						user_3_id: user_3,
						question_1: 'question_1',
						question_2: 'question_2',
						question_3: 'question_3',
						date: Date.today + 2
						)
				else
					user_1 = users.sample
					users.delete[user_1]

					user_2 = users.sample
					users.delete[user_2]

					i = Interview.new(
						user_1_id: user_1,
						user_2_id: user_2,
						question_1: 'question_1',
						question_2: 'question_2',
						date: Date.today + 2
						)
					i.save
				end
			end
		end
	end

end