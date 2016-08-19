class NetworksController < ApplicationController
  def index
  end

  def accept
    user = User.find(params[:id])
    me = User.find(current_user.id)

    relationship = Network.where(user:user, connect:me, confirmed:false)

    if relationship.exists?
      relationship.first.update_attribute(:confirmed, true)
      redirect_to '/professional_profile'
    else
      flash[:errors] = ["Oops! something went wrong! Please try again"]
      redirect_to :back
    end
  end

  def ignore
    user = User.find(params[:id])
    me = User.find(current_user.id)

    relationship = Network.where(user:user, connect:me, confirmed:false)

    if relationship.exists?
      relationship.destroy
      redirect_to '/professional_profile'
    else
      flash[:errors] = ['check you invitation, or tryagain']
      redirect_to :back
    end
  end

  def create
    user = User.find(params[:id])
    me = User.find(current_user.id)

    n = Network.new(user:me, connect:user, confirmed:false)
     if n.valid?
       n.save
       redirect_to '/professional_profile'
     end

  end

end
