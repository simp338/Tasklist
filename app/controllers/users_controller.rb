class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ登録が完了しました"
      redirect_to root_url
      #仮のリダイレクト
    else
      flash.now[:danger] = "ユーザ登録に失敗しました"
      render :new
    end
      
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
