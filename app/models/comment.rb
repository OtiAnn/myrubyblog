class Comment < ActiveRecord::Base
	# attr_accessible :post_id, :name, :email, :body, :post
  	belongs_to :post
  	validates_presence_of :name
  	validates_length_of :name, :within =>2..20
  	validates_presence_of :body
end
