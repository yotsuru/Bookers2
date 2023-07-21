class BooksController < ApplicationController
  def new
    @book = Book.new
  end
 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book), notice:"You have created book successfully."
    end
  end
  
  def index
    @books = Book.all  
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path, notice: "You have updated book successfully."
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :image, :opinion)
  end 
end
