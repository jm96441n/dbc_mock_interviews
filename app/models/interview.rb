class Interview < ActiveRecord::Base
	belongs_to :user_1, class_name: "User"
	belongs_to :user_2, class_name: "User"

	validates :user_1_id, :user_2_id, :date, :question_1, :question_2, presence: true

	def make_the_interview
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
			question_1 = question_2["description"]	
			
			user_1 = users.sample
			users.delete[user_1]

			user_2 = users.sample
			users.delete[user_2]

			i = Interview.new(
				user_1_id: 1,
				user_2_id: 2,
				question_1: 'question_1',
				question_2: 'question_2',
				date: Date.today + 2
				)
			i.save
		end
	end
end