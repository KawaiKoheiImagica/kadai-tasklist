class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:new,:show,:edit,:update,:create,:update
  ]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  before_action :user_check, only:[:show, :edit, :update, :destroy]
  def index
    #@tasks=Task.all.page
    #@tasks=Task.find(params[:id])
    if logged_in?
      @user = current_user
      @task = current_user.tasks.build  # form_for 用
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end
  
  def show
    #idid
    #set_task
    #user_check
    
  end
  
  def new
    @task=Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success]='Taskが正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger]='Taskが作成されませんでした'
      render :new
    end
  end
  
  def edit
    #set_task
    #user_check
  end
  
  def update
    #set_task
    #user_check
    
    if @task.update(task_params)
      flash[:success]='Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger]='Taskは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    #set_task
    #user_check
    @task.destroy
    
    flash[:success]='Taskは正常に削除されました'
    redirect_to tasks_url
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content,:status,:user_id)
  end
  
  def user_check
    if @task.user_id != session[:user_id]
      redirect_to root_url
    end
  end
end

