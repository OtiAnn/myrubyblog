class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@category = Category.all
	end
	
	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, :notice => "Your post has been saved!"
		else
			render "new"
		end
	end
	
	def edit
		
	end
	
	def update
		
	end
	
	def show
		@post = Post.find(params[:id])
	end
	
	def destroy
		
	end
end
