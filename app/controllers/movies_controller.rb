class MoviesController < ApplicationController
  def index
    # READS aka shows details for all movies
    @movies = Movie.all
  end

  def show
    # READS aka shows details for one movie
    @movie = Movie.find(params["id"])
  end

  def new_form
    # Create a movie form 
    
    render("/movies/new_form.html.erb")
  end

  def create_row
    # Creates a movie in table
    @movie = Movie.new
    
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    @movie.save

    render("/movies/show.html.erb")
  end

  def edit_form
    # Update form for a movie
    @movie = Movie.find(params[:id])
  end

  def update_row
    # Update the row for a movie
    
    @movie = Movie.find(params[:id])
    
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    render("show")
  end

  def destroy
    # deletes movies
    movie = Movie.find(params[:id])

    movie.destroy
  end
end
