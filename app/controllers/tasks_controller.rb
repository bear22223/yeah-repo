class TasksController < ApplicationController
  
  
  def index
    @user=User.find(params[:user_id])
    @tasks=@user.tasks
    
  end
  
  def show
    
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
    
  end
  
  
  
  def update
    
  end
  
  
  private
    
    # def tasks_params
    #   params.require(:user).permit(task: [:note_name, :note])[:task]
    # end
    
    def tasks_params
      params.require(:task).permit(:note_name, :note)
    end
  
end

