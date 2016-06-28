module GroupsHelper

	def render_group_title(group)
		truncate(group.title, :length => 20)
	end
	
	def render_group_description(group)
		truncate(group.description, :length => 40)
	end
	
	def render_post_content(post)
		simple_format(post.content)
	end
	
end
