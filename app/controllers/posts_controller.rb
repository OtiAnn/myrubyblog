class PostsController < ApplicationController
	def index
		@q = Post.search(params[:q])
		@posts = @q.result(distinct: true)
	end

	def new
		@post = Post.new
		@category = Category.all
	end
	
	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "您的文章儲存成功！"
			redirect_to @post
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to post_path, :notice => "您的文章更新成功！"
		else
			render "edit"
		end
	end
	
	def show
		@post = Post.find(params[:id])
		@user = AdminUser.all
		@comment = @post.comments.build()
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path

	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :category_id, :admin_user_id)
	end

end
