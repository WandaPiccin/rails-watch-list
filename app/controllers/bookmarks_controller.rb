class BookmarksController < ApplicationController
 

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmar.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to @list
    else
      flash[:notice] = @bookmarks.errors.full_messages.to_sentece
      redirect_to @list
    end
  end 

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
