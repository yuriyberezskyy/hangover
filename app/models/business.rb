class Business < ApplicationRecord

def self.add_restaurant_by_yelp_data(business)
       self.create(
           name: business["name"],
           url: business["url"],
           lat: business["coordinates"]["latitude"],
           long: business["coordinates"]["longitude"],
           image_url: business["image_url"],
           address: business["location"]["display_address"].join(", "),
           kind_of_food: business["categories"].map{|item| item["title"]}.join(", ")
       )
   end

end
