class User < ApplicationRecord
has_many :reviews
has_many :rsvps
has_many :party_times, through: :rsvps
has_many :businesses, through: :reviews
validates :email, presence: true, uniqueness: true
validates :full_name, presence: true
has_secure_password

end
