class UsersController < ApplicationController
  
  def tasks
    @user = User.find(params[:id])
    @tasks=@user.tasks
    @taskes=@tasks.new(note_params)
    @taskes.save
  end
  
  
  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
    
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def note_params
      params.require(:task).permit(:note_name, :note)
    end
  
end
