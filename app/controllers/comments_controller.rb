class CommentsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "1234", except: [:index, :show]

  def index
    @id = Comment.find(params[:id]).movie_id
    @name = Movie.find(@id).title
    @comments = []
    puts "***********************************"
    puts Comment.find_by(movie_id: @id)
    puts "***********************************"
    Comment.all.each do |comment|
      if comment.movie_id == @id
        @comments << comment
      end
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    comment = movie.comments.find(params[:id])
    comment.destroy
    redirect_to movie_path(movie), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end
