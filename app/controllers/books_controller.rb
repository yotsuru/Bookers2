class BooksController < ApplicationController
  def new
    @book = Book.new
  end
 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
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
    book.update(book_params)
    redirect_to book_path
  end
  
  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to '/books'
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :image, :opinion)
  end 
end
