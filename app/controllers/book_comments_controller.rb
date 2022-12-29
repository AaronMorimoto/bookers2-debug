class BookCommentsController < ApplicationController
  
  def create
    #@book_comment = BookComment.new(user_id: current_user.id, book_id: params[:book_id])
    #@book_comment.save
    #redirect_to books_path(params[:book_id])
    
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(params[:book_id])
  end
  
  def destroy
    #@book_comment = BookComment.find_by(user_id: current_user.id, book_id: params[:book_id])
    #@book_comment.destroy
    #redirect_to books_path(params[:book_id])
    @book_comment = BookComment.find_by(params[:book_id]).destroy
    redirect_to book_path
  end
  
  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
