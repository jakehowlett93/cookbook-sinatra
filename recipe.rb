class Recipe
  attr_reader :name, :description, :rating, :prep_time
  attr_accessor :marked

  def initialize(name, description, rating, marked, prep_time)
    @name = name
    @description = description
    @rating = rating
    @marked = marked
    @prep_time = prep_time
  end
end
