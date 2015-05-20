class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    #@books = Book.all
    @books = Book.all.limit(200)
  end

  # GET /books/search
  def search
    if defined? params[:letter]
      letter = params[:letter][0]
    else
      letter = 'A'
    end
    @page_number = 1
    @num_books = Book.count()

    begin
      @page_number = params[:page].to_i unless params[:page].blank?
      last_page = (@num_books / BBM::MAX_PAGE_ITEMS) + 1
      if @page_number <= 0
        @page_number = 1
      elsif @page_number > last_page
        @page_number = last_page
      end
    rescue
      logger.error "Page number not valid!"
    end

    @books = Book.where(title: /^#{letter}/i).without(:created, :last_modified, :latest_revision, :revision).asc(:title).skip((@page_number-1) * BBM::MAX_PAGE_ITEMS).limit(BBM::MAX_PAGE_ITEMS)
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      id_book = params[:id]
      @book = Book.find id_book
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :description)
    end
end
