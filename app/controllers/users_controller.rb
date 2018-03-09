class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create

    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to users_url
    end


  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
