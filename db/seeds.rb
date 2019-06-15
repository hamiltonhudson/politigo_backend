# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'dotenv'
require 'ffaker'

APP_ID = ENV['APP_ID']
EVENTS_API_KEY = ENV['EVENTS_API_KEY']
GEO_API_KEY = ENV['GEO_API_KEY']
CITY_API_KEY = ENV['CITY_API_KEY']

DatabaseCleaner.clean_with(:truncation)
# # FFaker::Name.unique.clear
#
causes_data = RestClient.get("https://api.cityofnewyork.us/calendar/v1/categories.htm?app_id=#{APP_ID}&app_key=#{EVENTS_API_KEY}")
parsed_causes = JSON.parse(causes_data)

# causes = parsed_causes.select do |cause|
#   cause == "Business & Finance" || cause == "City Government Office" || cause == "Cultural" || cause == "Education" || cause == "Environment" || cause == "Health & Public Safety" || cause == "Hearings and Meetings" || cause == "Parks & Recreation" || cause == "Street and Neighborhoood" || cause == "Volunteer"
# end

@causes = parsed_causes.reject do |cause|
  cause == "Athletic" || cause == "Featured" || cause == "Free" || cause == "General Events" || cause == "Holidays" || cause == "Kids and Family " || cause == "Tours"
end


def create_events
  @causes.each do |cause|
    @cause = cause
    events_data = RestClient.get("https://www1.nyc.gov/calendar/api/json/search.htm?app_id=#{APP_ID}&app_key=#{EVENTS_API_KEY}&categories=#{@cause}")
    parsed_events_data = JSON.parse(events_data)
    parsed_events_data = parsed_events_data["items"]
    parsed_events_data.each do |parsed_event|
      if !parsed_event["geometry"]
        geometry = "none"
      else
        geometry = parsed_event["geometry"]
        Event.create!({cause: cause, style: parsed_event["name"], location: parsed_event["address"], lat: parsed_event["geometry"][0]["lat"], long: parsed_event["geometry"][0]["lng"], date: Date.parse(parsed_event["startDate"]), time: parsed_event["timePart"]})
      end
    end
  end
end

create_events

10.times do
  @user_name = FFaker::Name.unique.name
  @initial = @user_name.split[0].split("")[0]
  @surname = @user_name.split[1]
  @user_email = @initial + @surname + "@email" + ".com"
  User.create!( name: @user_name, email: @user_email, password: "1234" )
end

user_ids = User.all.map {|user| user.id}
event_ids = Event.all.map {|event| event.id}

20.times { UserEvent.create!({user_id: user_ids.sample, event_id: event_ids.sample}) }

UserEvent.all.each do |ue|
  ue.user.increase_score
  ue.save
end
