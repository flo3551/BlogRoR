class UsersController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create, :confirm, :articles]
  before_action :only_signed_out, only: [:new, :create, :confirm]
  
  def index
  @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation)
    @user = User.new(user_params)
    @user.recover_password = nil
    if @user.valid?
      @user.save
      redirect_to root_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_params = params.require(:user).permit(:username, :firstname, :lastname, :avatar_file, :email)
    if @user.update(user_params)
      redirect_to articles_path, success: 'Votre compte a bien été mis à jour'
    else
      render :edit
    end
  end

end