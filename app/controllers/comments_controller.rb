class CommentsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "1234", except: [:index, :show]
  before_action :get_deatils, only: [:index]

  def index
    @comments = @movie.comments
    # Comment.all.each do |comment|
    #   puts "*************************"
    #   puts comment.movie_id,@id
    #   if comment.movie_id === @id.to_i
    #     puts "I am"
    #     @comments.push(comment)
    #   end
    # end
    # puts @comments
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error

    render file: "#{Rails.root}/public/404.html"
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
      @id = params[:id].to_i
      @movie = Movie.find(params[:id])
      @name = Movie.find(@id).title
    rescue ActiveRecord::RecordNotFound => error

      render file: "#{Rails.root}/public/404.html"

    end

    def comment_params
      params.require(:comment).permit(:commenter, :body, :status, :_destroy)
    end

end
