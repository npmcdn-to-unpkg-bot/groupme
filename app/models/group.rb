class Group < ActiveRecord::Base

	mount_uploader :image, ImageUploader

	scope :hot, -> { order("posts_count DESC") }

	belongs_to :owner, :class_name => "User", :foreign_key => :user_id
	has_many :posts
	has_many :group_users
	has_many :members, :through => :group_users, :source => :user
	
	validates :title, :presence => true
	
	after_create :join_owner_to_group #建立group的owner自然就應該是該group的member
	
	def editable_by?(user)
		user && user == owner
	end
	
	def join_owner_to_group
	  members << owner
	end
end
