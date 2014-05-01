class CommentsController < InheritedResources::Base
	def create
		# @comment = Comment.new(comment_params)
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = '您的回應儲存成功！'
			redirect_to(@comment.post)
		else
			flash[:notice] = "您的回應儲存失敗： #{@comment.errors}"
			redirect_to(@comment.post)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:post_id,:name,:email,:body)
	end
end