class BookCommentsController < ApplicationController


  def create

    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    if @comment.save
      #flash.now[:notice] = 'コメントを投稿しました'
      render :book_comments
    else
      render 'books/show'
    #redirect_to request.referer #元のURLに遷移するコード
    #else
      #@error_comment = comment
      #@book = Book.find(params[:book_id])
      #@book_comment = Book.new
      #render :'books/show'
    #end
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy#find(params[:id]).destroy
    #redirect_to  request.referer
    @book = Book.find(params[:book_id])
    render :book_comments
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
