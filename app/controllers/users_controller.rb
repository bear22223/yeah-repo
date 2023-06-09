class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :logged_in_user, only: [:index, :show, :update, :edit, :destroy]
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_or_correct_user, only: :show
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end  
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    if logged_in? && current_user
      flash[:info] = "すでにログインしています。"
      redirect_to current_user
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'ユーザーの新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_url
    else
      render :edit
    end
    
  end  
  
  def edit
    @user=User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "#{user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

