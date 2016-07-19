class Upcoming < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :date, presence: true

	validate :valid_date?

	def valid_date?
		date.tuesday? || date.thursday?
	end

	def next_day(day)
		date  = Date.parse(day)
	  days_between = date > Date.today ? 0 : 7
	  date + days_between
	end

	def following_day(day)
		next_day(day) + 7
	end

	def allowed_to_delete?
		Date.tomorrow != self.next_day('Tuesday') || 2.days.from_now != self.following_day('Tuesday') || Date.tomorrow != self.next_day('Thursday') || 2.days.from_now != self.following_day('Thursday') ? true : false

	end

end

