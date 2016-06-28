class Account::PostsController < ApplicationController
	before_action :login_required
	
	def index
		@posts = current_user.posts.recent.includes(:group) #post scope
	end
end
