class PagesController < ApplicationController

  skip_before_filter :require_login

  def home
    @user = User.new
    @schools = School.all
    @classrooms = ClassRoom.all

    if current_user
       redirect_to current_user and return
    end

    render :layout => "home"
  end

  def apropos
  end

  def confidentialite
  end

  def conditions
  end

  def aide
  end
end
