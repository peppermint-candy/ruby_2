class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/professional_profile'
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to :back
    end
  end

  def destroy
  end

  def logout
    reset_session
    redirect_to '/main'
  end
end
