class TasksController < ApplicationController
  
  def new
    @user = User.find(params[:id])
    @task = @user.tasks
  end
  
  
  def index
    @list = ["タスク1","タスク2","タスク3"]
  end
  
  
  def update
  end
  
end

