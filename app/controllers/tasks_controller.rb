class TasksController < ApplicationController
  
  
  def index
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    
  end
  
  def show
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    @tasks_id=@tasks.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
    
  end
  
  
  def create
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    @tasks = @tasks.new(tasks_params)
    if @tasks.save
      flash[:success]="タスクを新規作成しました。"
      redirect_to user_tasks_url(user)
    else
      render :new
    end
  end
  
  
  def edit
    @user = User.find(params[:user_id])
    @tasks=@user.tasks
    @tasks_id=@tasks.find(params[:id])
    
  end
  
  
  
  def update
    user=User.find(params[:user_id])
    tasks=user.tasks
    tasks=tasks.find_by(id: params[:id])
    if tasks.update(tasks_params)
      flash[:success]="タスクを更新しました。"
      redirect_to user_task_url(user, tasks)
    end
  end
  
  
  def destroy
    user=User.find(params[:user_id])
    tasks=user.tasks
    tasks_id=tasks.find(params[:id])
    if tasks_id.destroy
      flash[:success]="タスクを削除しました。"
      redirect_to user_tasks_url(user)
    end
  end
  
  
  private
    
    def tasks_params
      params.require(:task).permit(:note_name, :note)
    end
    
end

