require 'faker'

namespace :db do
	desc "Fill database with sample users"
	task :populate=>:environment do
	  Rake::Task['db:reset'].invoke
	  User.create!(:name=>"Kyle",
		       :email=>"koreill1@gmail.com",
		       :password=>"foobar",
		       :password_confirmation => "foobar")
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(:name => name,
				:email=> email,
				:password => password,
				:password_confirmation => password)
	end
      end
end
