class UserSessionsController < ApplicationController

  skip_before_filter :require_login, :except => [:destroy]
  
  def new
    @user = User.new
  end

  def create

    respond_to do |format|
      if @user = login(params[:mail],params[:password])
        if current_user.is_validated
          format.html { redirect_to current_user }
          format.xml { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { flash.now[:alert] = "Login failed."; redirect_to :logout}
        end
      else
        format.html { flash.now[:alert] = "Login failed."; redirect_to :root, :notice => 'Mauvais mot de passe ou e-mail!' }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy 
    if  current_user.is_validated
      logout
      redirect_to :root, :notice => 'Logged Out!'
    else
      logout
      redirect_to :root, :notice => 'Utilisateur non validé!'
    end
  end
end
