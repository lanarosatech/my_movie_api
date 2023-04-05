require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns a JSON response" do
      get :index
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    it "returns all movies when no parameters are provided" do
      get :index
      expect(JSON.parse(response.body).size).to eq Movie.count
    end

    it "returns only movies of a given genre when the 'genre' parameter is provided" do
      genre = "Action"
      get :index, params: { genre: genre }
      movies = JSON.parse(response.body)
      expect(movies.size).to eq Movie.where(genre: genre).count
      expect(movies.all? { |m| m["genre"] == genre }).to be true
    end

    it "returns only movies released after a given year when the 'year' parameter is provided" do
      year = "2019"
      get :index, params: { year: year }
      movies = JSON.parse(response.body)
      expect(movies.size).to eq Movie.where("year > ?", year).count
      expect(movies.all? { |m| m["year"].to_i > year.to_i }).to be true
    end
  end
end
