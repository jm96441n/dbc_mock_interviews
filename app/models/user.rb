class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_interviews
  has_many :interviews, through: :user_interviews
  has_many :upcomings

  validates :email, :name, presence: true

end
