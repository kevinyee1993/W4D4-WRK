class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to users_url
    else
      flash[:errors] = ["Invalid login credentials"]
      redirect_to users_url
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    logout
    # session[:session_token] = nil
    redirect_to new_session_url
  end




end
