class Upcoming < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :date, presence: true
	validate :valid_date?

	def valid_date?
		date.tuesday? || date.thursday?
	end

	def next_day(day)
		date  = Date.parse(day)
	  days_between = date > Date.today ? 0 : 7
	  date + days_between
	end

	def following_tuesday
		next_day('Tuesday') + 7
	end

	def following_thursday
		next_day('Thursday') + 7
	end

end

