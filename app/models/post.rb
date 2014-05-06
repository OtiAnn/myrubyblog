class Post < ActiveRecord::Base
	# attr_accessible :title, :body, :category_id, :admin_user_id
	mount_uploader :picture, PictureUploader
	default_scope order('created_at DESC')#?
	belongs_to :category
	belongs_to :admin_user
	has_many :comments, :dependent => :destroy
	has_many :votes, :dependent => :destroy
end
