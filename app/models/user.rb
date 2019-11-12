class User < ApplicationRecord
has_many :reviews
has_many :rsvps
has_many :places, source: :reviews, :class_name => "Business", :foreign_key => "id"
has_many :party_times, through: :rsvps
has_many :businesses, through: :party_times
has_secure_password

end
