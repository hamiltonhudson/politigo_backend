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
  {address: '549 Vale St. Brooklyn, NY 11224', long: '40.579930', lat: '-74.001640'},
  {address: '815 E. Essex Lane Staten Island, NY 10306', long: '40.582660', lat: '-74.157140'},
  {address: '706 South Mill Pond St. Bronx, NY 10461', long: '40.697440', lat: '-73.979440'},
  {address: '24 E. Chestnut Street New York, NY 10009', long: '43.231450', lat: '-75.442450'},
  {address: '275 East Pearl Court Brooklyn, NY 11207', long: '40.659520', lat: '-73.922070'}
]

addresses.each do |address|
  Event.create!({cause: causes.sample, style: styles.sample, location: address, date: Faker::Date.between(Date.parse('04/01/2019'), Date.parse('15/02/2019')), time: Faker::Time.forward(1, :day).strftime('%H:00')})
end
# location.first.update (then update for each one )
user_ids = User.all.map {|user| user.id}
event_ids = Event.all.map {|event| event.id}

# 8.times {
#   UserEvent.create!({user_id: user_ids.sample, event_id: event_ids.sample})
# }
