# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def search(type, location)
   url = "https://api.yelp.com/v3/businesses/search"
   params = {
   term: type,
   location: location,
   limit: 3,
   radius: 5
   }
   response = HTTP.auth("Bearer #{ENV['KEY']}").get(url, params: params)
   response.parse["businesses"]
end
def search_bars(location)
   search ("bar", location)
end
def search_clubs(location)
   search ("night club", location)
end
def search_restaurants(location)
   search ("restaurant", location)
end