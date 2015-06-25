class TasksController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@tasks =Task.all
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to root_path, :flash => { :success => "Task created successfully" }
    else
      render 'new'
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :content, :avatar, pictures_attributes: [:image] )
    end

end