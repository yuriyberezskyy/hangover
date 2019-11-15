class User < ApplicationRecord
has_many :reviews
has_many :rsvps, dependent: :destroy
has_many :party_times, through: :rsvps
has_many :businesses, through: :reviews
validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
validates :full_name, presence: true
has_secure_password

def username
    self.email.split("@")[0]
end

end
