require 'faker'

namespace :db do
	desc "Fill database with sample users"
	task :populate=>:environment do
	  Rake::Task['db:reset'].invoke
	  admin = User.create!(:name=>"Kyle",
		       :email=>"koreill1@gmail.com",
		       :password=>"foobar",
		       :password_confirmation => "foobar")
         admin.toggle!(:admin)
         
	  99.times do |n|
		  name = Faker::Name.name
		  email = "example-#{n+1}@railstutorial.org"
		  password = "password"
		  User.create!(:name => name,
				:email=> email,
				:password => password,
				:password_confirmation => password)
	  end
  
    User.all(:limit=>6).each do |user|
      50.times do
        user.microposts.create!(:content=>Faker::Lorem.sentence(5))
      end
    end
    
      users = User.all
      user = users.first
      following = users[1..50]
      followers = users[3..40]
      following.each  { |followed| user.follow!(followed)}
      followers.each  { |follower| follower.follow!(user)}
  end
end
