class Admin::PostsController < ApplicationController
	before_action :require_is_admin

	def index
		@posts = Post.all.recent.includes(:author, :group) #group scope
		
		respond_to do |format|
		  format.html
		  format.json { render :json => @posts.map(&:attributes) }
		  format.xml { render :xml => @posts.to_xml }
		  format.csv do
			csv_string = CSV.generate do |csv|
				csv << ["Content", "Image", "From Group", "Author", "AuthorEmail", "Created At"]
				@posts.each do |post|
					csv << [post.content, post.image, post.group.title, post.author.name, post.author.email, post.created_at.to_s(:long)]
				end
			end
			render :text => csv_string
		  end
	  
		end

	end

end
