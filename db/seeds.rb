# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#0: room
#1: projector
#2: speaker
#3: chairs
#4: tables
asset_names_and_kinds = [{name: "meeting hall 2",
                          kind: 0},
                         {name: "amphitheater",
                          kind: 0},
                         {name: "meeting hall 1",
                          kind: 0},
                         {name: "side room 1",
                          kind: 0},
                         {name: "room a113",
                          kind: 0},
                         {name: "Panasonic1",
                          kind: 1},
                         {name: "Espon2",
                          kind: 1},
                         {name: "Hitachi",
                          kind: 1},
                         {name: "Mackies",
                          kind: 2},
                         {name: "JBLs",
                          kind: 2},
                         {name: "Kenwoods",
                          kind: 2},
                         {name: "metal folding",
                          kind: 3,
                          max_quantity: 100},
                         {name: "plastic folding",
                          kind: 3,
                          max_quantity: 200},
                         {name: "plastic stacking",
                          kind: 3,
                          max_quantity: 20},
                         {name: "8 foot round",
                          kind: 4,
                          max_quantity: 32},
                         {name: "6 foot wood",
                          kind: 4,
                          max_quantity: 25},
                         {name: "4 foot wood",
                          kind: 4,
                          max_quantity: 20}]

asset_names_and_kinds.each do |one|
  Asset.find_or_create_by(one)
end

user_base = [{email: "lisa@simpsons.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf"},
             {email: "bart@simpsons.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf"},
             {email: "marge@simpsons.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf"},
             {email: "milhouse@friends.io",
              password: "asdfasdf",
              password_confirmation: "asdfasdf"},
             {email: "ned@flanders.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf"},
             {email: "jeff@androiddungeon.com",
              password: "asdfasdf",
              password_confirmation: "asdfasdf"}]

user_base.each do |one|
  @user = User.find_or_create_by(email: one[:email])
  @user.password = one[:password]
  @user.save
end

@jeff = User.find_by(email:"jeff@androiddungeon.com")
@bart = User.find_by(email:"bart@simpsons.com")

event_details = [{user_id: @jeff.id, event_date: DateTime.new(2016, 8, 15), title:"Recycling Discussion"},
                 {user_id: @jeff.id, event_date: DateTime.new(2016, 8, 18), title:"XBOX party", public:false},
                 {user_id: @bart.id, event_date: DateTime.new(2016, 9, 16), title:"Viewing Super Bowl", public:false},
                 {user_id: @bart.id, event_date: DateTime.new(2016, 10, 16), title:"Lisa's dumb meeting"}]

event_details.each do |one|
  Event.find_or_create_by(one)
end

@recycle = Event.find_by(title:"Recycling Discussion")
@recycle.assets << [Asset.first, Asset.last]
@xbox = Event.find_by(title:"XBOX party")
@xbox.assets << Asset.second
@superbowl = Event.find_by(title:"Viewing Super Bowl")
@superbowl.assets << Asset.find_by(name:"Hitachi")
@superbowl.assets << Asset.find_by(name:"Mackies")
@superbowl.assets << Asset.find_by(name:"Mackies")
@superbowl.assets << Asset.find_by(name:"room a113")
@dumb = Event.find_by(title:"Lisa's dumb meeting")
@dumb.assets << Asset.third

