class BookmarksController < ApplicationController

  # def new
  #   @list = List.find(params[:list_id])
  #   @bookmark = Bookmark.new
  #   @bookmark.list = @list
  #   @movies = Movie.all
  # end

  # def create
  #   @list = List.find(params[:list_id])
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.list = @list
  #   if @bookmark.save
  #     redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
  #   else
  #     @bookmark = Bookmark.new
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params) # Build a new bookmark associated with the list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      @movies = Movie.all # Make sure you load the movies for the form
      @review = Review.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  # def destroy
  #   @bookmark = Bookmark.find(params[:id])
  #   @list = @bookmark.list
  #   @bookmark.destroy
  #   redirect_to list_path(@list), notice: 'Bookmark was successfully removed.'
  # end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully deleted.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
