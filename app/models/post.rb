class Post < ActiveRecord::Base
	
	mount_uploader :image, ImageUploader

	scope :recent, -> { order("updated_at DESC") }
	
	belongs_to :author, :class_name => "User", :foreign_key => :user_id
	
	validates :content, :presence => true

	belongs_to :group, :counter_cache => true
	
	def editable_by?(user)
		user && user == author
	end
end
