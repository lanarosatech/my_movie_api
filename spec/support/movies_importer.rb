require 'csv'

class MoviesImporter
  def self.import
    csv_text = File.read(Rails.root.join('netflix_title.csv'))
    csv = CSV.parse(csv_text, headers: true)

    csv.each do |row|
      movie_params = row.to_hash.slice('title', 'year', 'genre', 'country')
      Movie.create!(movie_params)
    end
  end
end
