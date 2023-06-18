class TasksController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create, :update, :edit, :destroy]
  before_action :logged_in_user, only: [:index, :show, :new, :create, :update, :edit, :destroy]
  before_action :correct_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @user=User.find(params[:user_id])
    @tasks=@user.tasks.order(created_at: :desc)
  end
  
  def show
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    @tasks_id=@tasks.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @tasks = Task.new
  end
  
  def create
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    @tasks = @tasks.new(tasks_params)
    if @tasks.save
      flash[:success]="タスクを新規作成しました。"
      redirect_to user_tasks_url(@user)
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @tasks=Task.find(params[:id])
    # if  !current_user? @user
    #   flash[:danger] = "権限がありません。"
    #   redirect_to user_tasks_path(current_user)
    # end
  end  
  
  def update
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    @tasks=@tasks.find_by(id: params[:id])
    if @tasks.update(tasks_params)
      flash[:success]="タスクを更新しました。"
      redirect_to user_task_url(@user, @tasks)
    else
      render :edit
    end
  end
  
  def destroy
    user=User.find(params[:user_id])
    task=Task.find(params[:id])
    task.destroy
      flash[:success]="タスクを削除しました。"
      redirect_to user_tasks_url(user)
  end
  
  private
    
    def tasks_params
      params.require(:task).permit(:note_name, :note)
    end
end


