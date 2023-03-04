class CommentsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "1234", except: [:index, :show]
  before_action :get_deatils, only: [:index]

  def index
    @comments = []
    Comment.all.each do |comment|
      if comment.movie_id == @id
        @comments << comment
      end
    end
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    # puts @comment.body
    redirect_to movie_path(@movie)
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    comment = movie.comments.find(params[:id])
    comment.destroy
    redirect_to movie_comments_path(movie), status: :see_other
  end

  private

    def get_deatils
      @id = Comment.find(params[:id]).movie_id
      @movie = Movie.find(params[:id])
      @name = Movie.find(@id).title
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end
