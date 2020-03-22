class BooklistsController < ApplicationController
  def new
  	@book = Book.new
  	# 今回はモデル名＝Book
  end

  def create
    @books = Book.all
  	@book = Book.new(book_params)
    #サクセスメッセージの表示をする
  	if @book.save
      flash[:notice] = "Book was successfully created."
  	  redirect_to booklist_path(@book.id)
    # redirect_to ''で投稿画面submitしたら''画面へ行く
  else
    render :index
    # redirect_to url:("/booklists")
    end

  end

  def index
    @books = Book.all
    @book = Book.new
  end
  # routes.rbで追加したindexをこちらにも追加する②⇨viewファイルにindexファイルを作成する
  def show
    @book = Book.find(params[:id])
  end

  def edit
    # editアクションを追加したので、それ用のhtmlを作成する
    @book = Book.find(params[:id])
    @books = Book.find(params[:id])
  end
  # findメゾットを使ってデータを取得する

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update."
      redirect_to booklist_path(@book.id)
      else
    render action: :edit
    end
  end
  # routes.rbでurlを追加する
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to booklists_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
