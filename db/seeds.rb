# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'database_cleaner'
# require 'faker'
# require 'ffaker'
#
DatabaseCleaner.clean_with(:truncation)

1.times { User.create!({name: FFaker::Name.unique.name}) }

causes = ['climate change', 'immigration', 'healthcare', 'women\'s rights', 'minority rights', 'union/workers rights', 'foreign relations', 'economy/taxes/inflation', 'jobs & job creation']

styles = ['protest demonstration (march or rally)', 'meet-and-greet', 'fundraiser', 'policy discussion/debate', 'conference/convention', 'strategy meeting', 'local campaigning', 'community organizing']


addresses = [
  {address: '549 Vale St. Brooklyn, NY 11224', lat: '40.579930', long: '-74.001640'},
  {address: '815 E. Essex Lane Staten Island, NY 10306', lat: '40.582660', long: '-74.157140'},
  {address: '90 W 164th St, Bronx, NY 10452', lat: '40.832520', long: '-73.928871'},
  {address: '24 E. 4th Street New York, NY 10009', lat: '40.724270', long: '-73.984830'},
  {address: '275 East Pearl Court Brooklyn, NY 11207', lat: '40.659520', long: '-73.922070'},
  {address: '452 5th Ave New York, NY 10018', lat: '40.752209', long: '-73.982239'},
  {address: '190 W 100th St New York, NY 10025', lat: '40.796090', long: '-73.968520'},
  {address: '52 Chambers St New York, NY 10007', lat: '40.713370', long: '-74.005540'},
  {address: '23-15 Newtown Ave Astoria, NY 11102', lat: '40.769560', long: '-73.922620'},
  {address: '345 Brook Ave, Bronx, NY 10454', lat: '40.810230', long: '-73.917870'},
]

addresses.each do |address|
  Event.create!({cause: causes.sample, style: styles.sample, location: address[:address], lat: address[:lat], long: address[:long], date: Faker::Date.between(Date.parse('04/01/2019'), Date.parse('15/02/2019')), time: Faker::Time.forward(1, :day).strftime('%H:00')})
end
# location.first.update (then update for each one )
user_ids = User.all.map {|user| user.id}
event_ids = Event.all.map {|event| event.id}

# 8.times {
#   UserEvent.create!({user_id: user_ids.sample, event_id: event_ids.sample})
# }
