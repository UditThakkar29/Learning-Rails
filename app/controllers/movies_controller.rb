class MoviesController < ApplicationController
  http_basic_authenticate_with name: "user", password: "1234", except: [:index, :show]

  before_action :get_movies, only: [:show,:edit,:update,:destroy]
  def index
    @movies = Movie.all
  end
  def show
    render layout: "test"
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def get_movies
      @movie = Movie.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      # render plain: "Movie Record Not Available"
      render file: "#{Rails.root}/public/404.html"
      # render status: 500
      # render inline: "<h1>Movie Record Not Available</h1>"
      # render html: helpers.tag.strong('Movie Record Not Available')
      # render js: "alert('Hello Rails');"
      # render MyRenderable.new
      # render body: movies_path
      # head :created, location: movie_path(@movie)
      # redirect_to root_path, :locals => {:var => "The movie you searched for is not present!"}

      # redirect_to root_path

      # redirect_to "https://i.redd.it/ds1luav7dl851.jpg", allow_other_host: true
    end
    # def special_method
    #   puts "Not Available"
    # end
    def movie_params
      params.require(:movie).permit(:title, :body, :status, comments_attributes: [:commenter, :body])
    end
end
