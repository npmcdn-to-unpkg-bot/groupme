class Admin::GroupsController < ApplicationController
	before_action :require_is_admin

	def index
		@groups = Group.all.hot.includes(:owner) #group scope
		
		respond_to do |format|
		  format.html
		  format.json { render :json => @groups.map(&:attributes) }
		  format.xml { render :xml => @groups.to_xml }
		  format.csv do
			csv_string = CSV.generate do |csv|
				csv << ["Title", "Description", "Created At", "Posts", "Image"]
				@groups.each do |group|
					csv << [group.title, group.description, group.created_at, group.posts.size, group.image]
				end
			end
			render :text => csv_string
		  end
	  
		end

	end
end
