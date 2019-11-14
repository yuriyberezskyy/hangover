class PartyTime < ApplicationRecord
belongs_to :business 
has_many :rsvps, dependent: :destroy
has_many :users, through: :rsvps
validates :occasion, uniqueness: true, presence: true
validates :date, presence: true
end
