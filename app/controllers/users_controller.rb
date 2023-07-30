class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def create
    @user = User.new(user_params)
   if @user.save
    redirect_to user_path(user.id), notice: "Welcome! You have signed up successfully."
   else
    render :new
   end
  end
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
