require_relative 'view'
require_relative 'recipe'
require_relative 'parsing'
require 'pry-byebug'

class Controller
  attr_accessor :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = cookbook.all
    @view.print_intro_message("display", nil)
    @view.display(recipes,5)
  end

  def create
    name = @view.ask_name
    description = @view.ask_description
    prep_time = @view.ask_prep_time
    new_recipe = Recipe.new(name, description, prep_time)
    cookbook.add_recipe(new_recipe)
  end

  def destroy
    index = @view.ask_for_index("delete")
    cookbook.remove_recipe(index - 1)
  end

  def import
    ingredient = @view.ask_ingredient
    @view.print_intro_message("import", ingredient)
    results = Parsing.new(ingredient).get_results
    @view.display(results, 5)
    results_index = @view.ask_for_index('import')
    cookbook.add_recipe(results[results_index - 1])
  end

  def mark_as_done
    index = @view.ask_for_index("mark as done?")
    cookbook.mark_recipe(index - 1)
  end

end
