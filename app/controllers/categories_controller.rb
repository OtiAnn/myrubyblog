class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @title = @category.name
    @posts = @category.posts
  end

  def new
  	@category = Category.new
  end

  def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "您的文章類別儲存成功！"
			redirect_to @category
		else
			render "new"
		end
	end
  
  def edit
		@category = Category.find(params[:id])
  end
  
  def update
		@category = Category.find(category_params)
		@user = AdminUser.all
		if @category.update_attributes(params[:post])
			redirect_to category_path, :notice => "您的文章類別更新成功！"
		else
			render "edit"
		end
  end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end