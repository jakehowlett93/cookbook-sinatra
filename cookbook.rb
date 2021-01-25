require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :cookbook_data

  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_recipes_from_file
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    CSV.open(@csv_file_path, 'a') do |row|
      row << [recipe.name, recipe.description, recipe.rating, recipe.marked, recipe.prep_time]
    end
  end

  def mark_recipe(recipe_index)
    @recipes[recipe_index].marked = true
    CSV.open(@csv_file_path, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.marked, recipe.prep_time]
      end
    end
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    CSV.open(@csv_file_path, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.marked, recipe.prep_time]
      end
    end
  end

  private

  def load_recipes_from_file
    CSV.open(@csv_file_path).each do |recipe|
      @recipes << Recipe.new(recipe[0], recipe[1], recipe[2], recipe[3], recipe[4])
    end
  end
end
