class MoviesController < ApplicationController
  http_basic_authenticate_with name: "user", password: "1234", except: [:index, :show]

  before_action :get_movies, only: [:show,:edit,:update,:destroy]
  def index
    @movies = Movie.all
  end
  def show
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
    movie.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def get_movies
      @movie = Movie.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      redirect_to root_path
    end

    def movie_params
      params.require(:movie).permit(:title, :body, :status)
    end
end
