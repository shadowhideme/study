module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        rating_array = array.select { |film| film['country'].to_s.count(',') >= 1 }
                            .select { |film| film['rating_kinopoisk'].to_f > 0.0 }
                            .map { |film| film['rating_kinopoisk'].to_f }
        return 0 if rating_array.count.zero?

        rating_sum = rating_array.reduce(:+)
        rating_sum / rating_array.count
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f > threshold }
             .map { |film| film['name'].to_s.count('и') }
             .reduce(:+)
      end
    end
  end
end
