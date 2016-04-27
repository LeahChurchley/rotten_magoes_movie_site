class SessionsController < ApplicationController
  def new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to movies_path, notice: "Byeeee!"
    end

end
