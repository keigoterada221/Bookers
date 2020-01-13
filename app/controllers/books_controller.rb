class BooksController < ApplicationController

	def top
	end

	def index
    	@books = Book.all
    	# newアクションを消してここに追加した
    	@book = Book.new
    end

	def create
		# # ストロングパラメータ使用
		# book = Book.new (book_params)
		# # DBへ保存
		# book.save
		# # 送信した投稿単体の詳細画面へ
		# redirect_to book_path(book.id)

        @book = Book.new(book_params)
        @books = Book.all
        if @book.save
            flash[:notice] = "Book was successfully created."
          redirect_to book_path(@book.id)
        else
        # renderは投稿に失敗したデータが消えずにそのまま続きから作業できる時に使う。
        # redirect_toだと失敗した投稿内容が消えてしまう
        # 変数も他のアクションのものは使えなくなるので注意
          render :index
        end



    end


	def show
		@book = Book.find(params[:id])
	end

    def edit
    	@book = Book.find(params[:id])
    end

    def update
        # 下記のrenderでeditのhtmlに飛びたいが、飛ぶ先にあるインスタンス変数が
        # updateアクション内にないのでeditアクション内の変数をコピーして貼り付ける
        # 下記の変数をbookから@bookに変更
        @book = Book.find(params[:id])
    	# book = Book.find(params[:id])を上記に変更
    	#book.update(book_params)
    	# 詳細画面へ
        if @book.update(book_params)
            flash[:notice] = "Book was successfully updated."
          redirect_to book_path(book.id)
        else
            render :edit
        end
    end

    def destroy
    	# book = Book.find(params[:id])
    	# book.destroy
    	# 画面変更なし
        # redirect_to books_path
        book = Book.find(params[:id])
        if book.destroy
            flash[:notice] = "Book was successfully destroyed."
            redirect_to books_path
        end
    end

	private

	def book_params
		params.require(:book).permit(:title,:body)
	end
end
