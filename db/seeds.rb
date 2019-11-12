# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Business.destroy_all
PartyTime.destroy_all
Review.destroy_all
Rsvp.destroy_all

def search(type, location)
   url = "https://api.yelp.com/v3/businesses/search"
   params = {
   term: type,
   location: location,
   limit: 3,
   radius: 1000
   }
   response = HTTP.auth("Bearer #{ENV['KEY']}").get(url, params: params)
   response.parse["businesses"]
    # byebug
end
def search_bars(location)
   search("bar", location)
end
def search_clubs(location)
   search("night club", location)
end
def search_restaurants(location)
   search("restaurant", location)
end

dumbo_bars = search_bars(11201)
dumbo_clubs= search_clubs(11201)
dumbo_rests = search_restaurants(11201)

bushwick_bars = search_bars(11206)
bushwick_clubs = search_clubs(11206)
bushwick_rests = search_restaurants(11206)

wburg_bars = search_bars(11211)
wburg_clubs = search_clubs(11211)
wburg_rests = search_restaurants(11211)

sheepbay_bars = search_bars(11235)
sheepbay_clubs = search_clubs(11235)
sheepbay_rests = search_restaurants(11235)

dumbo_bars.each do |business|
    db = Business.add_bars_by_yelp_data(business)
    db.update(area: "Dumbo")
    end

dumbo_clubs.each do |business|
    dc = Business.add_clubs_by_yelp_data(business)
   dc.update(area: "Dumbo")
    end

 dumbo_rests.each do |business|
    dr = Business.add_rests_by_yelp_data(business)
    dr.update(area: "Dumbo")
end

bushwick_bars.each do |business|
    db = Business.add_bars_by_yelp_data(business)
    db.update(area: "Bushwick")
    end

bushwick_clubs.each do |business|
    dc = Business.add_clubs_by_yelp_data(business)
   dc.update(area: "Bushwick")
    end

 bushwick_rests.each do |business|
    dr = Business.add_rests_by_yelp_data(business)
    dr.update(area: "Bushwick")
end

wburg_bars.each do |business|
    db = Business.add_bars_by_yelp_data(business)
    db.update(area: "Williamsburg")
    end

wburg_clubs.each do |business|
    dc = Business.add_clubs_by_yelp_data(business)
   dc.update(area: "Williamsburg")
    end

 wburg_rests.each do |business|
    dr = Business.add_rests_by_yelp_data(business)
    dr.update(area: "Williamsburg")
end

sheepbay_bars.each do |business|
    db = Business.add_bars_by_yelp_data(business)
    db.update(area: "Sheepshead Bay")
    end

sheepbay_clubs.each do |business|
    dc = Business.add_clubs_by_yelp_data(business)
   dc.update(area: "Sheepshead Bay")
    end

 sheepbay_rests.each do |business|
    dr = Business.add_rests_by_yelp_data(business)
    dr.update(area: "Sheepshead Bay")
end