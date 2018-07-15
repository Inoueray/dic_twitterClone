class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "ユーザー登録完了！"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @favorite_blogs = @user.favorite_blogs
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを編集したよ！"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
