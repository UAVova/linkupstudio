class TasksController < ApplicationController

  def index
  	@tasks = Task.where("state = 2").order("id DESC")
    authorize! :see, :tasks
  end

  def show
  	@task = Task.find_by_token params[:id]
    authorize! :show, @task
  end

  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find_by token: params[:id]
    @states = TaskState.all
    authorize! :edit, @task
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

  def update
    
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task.token)
    else
      render 'edit'
    end
  end

  def user_tasks
    @tasks = Task.where user_id: current_user.id if user_signed_in?
  end

  private

    def task_params
      params.require(:task).permit( :title, :content,  :avatar, :state, :pictures_to_delete    => [],
                                                                        :attachments_to_delete => [],
                                                                        attachments_attributes:   [:document],
                                                                        pictures_attributes:      [:image],
                                                                        comments_attributes:      [:content] )
    end

end