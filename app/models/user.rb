class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interviews, class_name: "Interview", foreign_key: "user_1_id"
  has_many :interviews, class_name: "Interview", foreign_key: "user_2_id"
  has_many :registrations
end
