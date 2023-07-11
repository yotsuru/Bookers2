class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
     @books = B.all  
  end

  def show
  end

  def edit
  end
end
