# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

UserType.create([{ :label => 'Eleve' }, { :label => 'Professeur' }])

School.create([{:label => "IUT Michel de Montaigne"}])

ClassRoom.create([{:label => "SRC 13", :school_id => 1}, {:label => "PUB 13", :school_id => 1}])

User.create([{
  :name => "Millaret",
  :firstname => "Helene",
  :mail => "helene@me.com",
  :password => "admin",
  :is_validated => true,
  :class_room_id => 1,
  :user_type_id => 2
  }]);
