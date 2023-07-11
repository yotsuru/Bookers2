class UsersController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
