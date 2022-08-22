class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
    @createdbook = Book.new
  end

  def create
    @createdbook = Book.new(book_params)
    if @createdbook.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@createdbook.id)
    else
      @books = Book.all
      @book = Book.new
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @updated_book = Book.find(params[:id])
  end

  def update
    @updated_book = Book.find(params[:id])
    if @updated_book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@updated_book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
