class UsersController < ApplicationController
  def index
    @me = User.find(current_user.id)

    @users = User.where.not(email:@me.email)
    @network = Network.all

  end

  def create
    user = User.new(name:params[:name], email:params[:email], password:params[:password], description:params[:desc])

    if user.valid?
      user.save
      last_user = User.last
      session[:user_id] = last_user.id
      redirect_to '/professional_profile'
    else
      flash[:errors] = [user.errors.full_messages]
      redirect_to :back
    end
  end

  def my_profile
    @me = User.find(current_user.id)
    @my_connects = Network.where(user:@me, confirmed:true)

    @am_connects = Network.where(connect:@me, confirmed:true)

    @pendings = Network.where(connect:@me, confirmed:false)
  end

  def show
    @guest = User.find(params[:id])
  end


end
