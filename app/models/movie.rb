class Movie < ActiveRecord::Base
    def self.all_ratings
        Movie.select(:rating).map(&:rating).uniq.sort
    end

    def self.with_ratings(ratings_list)
        # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
        #  movies with those ratings
        # if ratings_list is nil, retrieve ALL movies
        return self.all if ratings_list == nil
        where('rating IN (?)', ratings_list)
    end
end
