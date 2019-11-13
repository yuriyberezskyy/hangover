class PartyTime < ApplicationRecord
belongs_to :business 
has_many :rsvps
has_many :users, through: :rsvps
end
