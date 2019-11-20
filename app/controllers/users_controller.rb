class UsersController < ApplicationController

  # before_action :authenticate_user!, except: [:top, :about]
  # before_action :cuser, only: [:update, :edit]

  def show
  	@user = User.find(params[:id])
  	@comics = @user.comics.order(id: :desc)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to user_path(@user)
  	else
  	  render :edit
  	end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to  withdraw_path
  end

  def withdraw
  end


  private

  def user_params
    params.require(:user).permit(:email, :nickname, :message, :prof_image)
  end

end
