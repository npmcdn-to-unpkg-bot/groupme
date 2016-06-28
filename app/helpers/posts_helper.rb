module PostsHelper

	def render_post_group_title(post)
		truncate(post.group.title, :length => 20)
	end

end
