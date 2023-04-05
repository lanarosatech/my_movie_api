require 'csv'

class MoviesController < ApplicationController
  def upload_csv
    csv_text = File.read(params[:file].path)
    csv = CSV.parse(csv_text, headers: true)

    csv.each do |row|
      create_movie_from_csv_row(row)
    end
    render json: { message: 'Arquivo CSV carregado com sucesso!' }
  end

  def index
    @movies = Movie.order(year: :desc)
    filter_movies
    render json: @movies, content_type: 'application/json'
  end

  def filter_movies
    @movies = Movie.all
    filter_by_year if params[:year].present?
    filter_by_genre if params[:genre].present?
    filter_by_country if params[:country].present?
  end

  private

  def create_movie_from_csv_row(row)
    movie = Movie.new(
      title: row['title'],
      genre: row['listed_in'],
      year: row['release_year'],
      country: row['country'],
      published_at: Date.strptime(row['date_added'], '%B %e, %Y'),
      description: row['description']
    )

    movie.save unless Movie.exists?(title: movie.title)
  end

  def filter_by_year
    @movies = @movies.where(year: params[:year])
  end

  def filter_by_genre
    @movies = @movies.where('genre LIKE ?', "%#{params[:genre]}%")
  end

  def filter_by_country
    @movies = @movies.where('country LIKE ?', "%#{params[:country]}%")
  end
end
