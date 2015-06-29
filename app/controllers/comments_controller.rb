class CommentsController < ApplicationController

	def create
		@task = Task.find(params[:task_id])
	    @comment = Comment.new(comment_params)
	    @comment.task = @task
	  	@comment.user_id = current_user.id
	    if @comment.save
	      redirect_to task_path(@task.token), :flash => { :success => "Comment successfully added" }
	    else
	      redirect_to task_path(@task.token), :flash => { :error => "Some error occured" }
	    end
	end

	private

	  def comment_params
	  	params.require(:comment).permit(:content)
	  end
end