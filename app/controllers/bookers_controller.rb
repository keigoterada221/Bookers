class BookersController < ApplicationController

	def top
	end

	def index
    	@books = Book.all
    	# newアクションを消してここに追加した
    	@book = Book.new
    end

	def create
		# ストロングパラメータ使用
		book = Book.new (book_params)
		# DBへ保存
		book.save
		# 送信した投稿単体の詳細画面へ
		redirect_to
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
    	# 詳細画面へ
    	redirect_to
    end

    def destroy
    	book = Book.find(params[id])
    	book.destroy
    	# 画面変更なし
    	redirect_to
    end

	private

	def book_params
		params.require(:book).permit(:title,:body)
	end

end
