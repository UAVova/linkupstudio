class TasksController < ApplicationController

  def index
  	@tasks = Task.all.order("id DESC")
  end

  def show
  	@task = Task.find_by_token params[:id]
    authorize! :read, @task
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
      params.require(:task).permit(:title, :content, :avatar, files_attributes:    [:document],
                                                              pictures_attributes: [:image] )
    end

end