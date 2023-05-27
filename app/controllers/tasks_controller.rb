class TasksController < ApplicationController
  
  
  def index
    @task=Task.find(params[:user_id])
    @list = ["タスク1","タスク2","タスク3"]
    
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
  
  
  
  # @user = User.find(params[:id])
  #   @tasks=@user.tasks
  #   @taskes=@tasks.new(note_params)
  #   if@taskes.save
  #   redirect_to "#"
  
  
  
  
  
  
  
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

