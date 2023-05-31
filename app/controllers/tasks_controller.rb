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
    @task = Task.find(params[:user_id])
    
  end
  
  
  def create
    user=User.find(params[:user_id])
    tasks=user.tasks
    tasks = tasks.new(tasks_params)
    if tasks.save
      redirect_to "#"
    end
  end
  
  
  def edit
    @task=Task.find(params[:user_id])
  end
  
  
  
  def update
    user=User.find(params[:user_id])
    tasks=user.tasks
    tasks=tasks.find_by(id: params[:id])
    tasks.update(tasks_params)
    redirect_to "#"
  end
  
  
  private
    
    def tasks_params
      params.require(:task).permit(:note_name, :note)
    end
    
end

