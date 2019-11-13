class Business < ApplicationRecord
has_many :reviews
has_many :party_times
has_many :rsvps, through: :party_times
has_many :reviewers, through: :reviews
has_many :users, through: :rsvps


def self.add_bars_by_yelp_data(business)
       self.create(
           name: business["name"],
           url: business["url"],
           img_url: business["image_url"],
           location: business["location"]["display_address"].join(", "),
           rating: business["rating"],
           category: "bars"
       )
   end

   def self.add_clubs_by_yelp_data(business)
       self.create(
           name: business["name"],
           url: business["url"],
           img_url: business["image_url"],
           location: business["location"]["display_address"].join(", "),
           rating: business["rating"],
           category: "clubs"
       )
   end

    def self.add_rests_by_yelp_data(business)
       self.create(
           name: business["name"],
           url: business["url"],
           img_url: business["image_url"],
           location: business["location"]["display_address"].join(", "),
           rating: business["rating"],
            category: "restaurants"

       )
   end


  

end
