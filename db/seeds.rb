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

5.times { Event.create!({cause: causes.sample, style: styles.sample, location: Faker::Address.street_address, date: Faker::Date.between(Date.parse('04/01/2019'), Date.parse('15/02/2019')), time: Faker::Time.forward(1, :day).strftime('%H:00')}) }

user_ids = User.all.map {|user| user.id}
event_ids = Event.all.map {|event| event.id}

# 8.times {
#   UserEvent.create!({user_id: user_ids.sample, event_id: event_ids.sample})
# }
