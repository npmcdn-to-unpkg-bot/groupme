# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(:name => "Dpan Admin", :email => "dpan.orz@gmail.com", :password => "123456", :password_confirmation => "123456")
admin.is_admin = true
admin.save!

create_groups = for i in 1..10 do
	group = Group.new(:title => "討論區第#{i}組", :description => "這是用種子建立的第#{i}個討論版\n\n這是用種子建立的第#{i}個討論版")
	group.image = File.open("public\/group#{i}.jpg")
	group.owner = admin
	group.save!
		for k in 1..10 do
			post = group.posts.build(:content => "這是用種子建立的第 #{k} 個描述\n\n這是用種子建立的第 #{k} 個描述")
			post.image = File.open("public\/post#{k}.jpg")
			post.author = admin
			post.save!
		end
	end
