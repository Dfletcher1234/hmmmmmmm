class UsersController < ApplicationController

def create
  @user = User.new

  @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]



  if @user.save
    redirect_to users_url
  else
    render :new
  end

end

def new
@user = User.new

end






















end
