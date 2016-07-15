class Upcoming < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :date, presence: true
	validate :valid_date?

	def valid_date?
		date.tuesday? || date.thursday?
	end


end

