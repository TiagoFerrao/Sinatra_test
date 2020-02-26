class View

  def display(recipes, items_per_page)
    #creates an array with pages of recipes (each page with a number of items = items_per_page)
    pages = recipes.each_slice(items_per_page).to_a
    pages.each_with_index do |page_of_recipes, page_number| #shows a page
        puts "\nPage #{page_number + 1} of #{pages.count}"
        page_of_recipes.each_with_index do |recipe, index|
          puts "#{index + 1 + page_number * items_per_page} - #{recipe.done ? "[x]" : "[ ]"} #{recipe.name} #{recipe.prep_time}\n"
        end
        unless page_number + 1 == pages.count
          puts "press any key for next page or \"m\" for the menu >"
          input = gets.chomp.downcase
          break if input == "m"
        end
    end
  end


  def print_intro_message(action, ingredient)
      case action
      when "import" then puts "Looking for \"#{ingredient}\" recipes"
      when "display" then puts "\n  -- Here are all your recipes --"
      end
  end

  def ask_name
    puts 'Whats the name of the new recipe?'
    gets.chomp
  end

  def ask_description
    puts 'Whats the description of the new recipe?'
    gets.chomp
  end

  def ask_prep_time
    puts 'Whats the preparation time of the new recipe (in minutes)?'
    gets.chomp.to_i
  end

  def ask_ingredient
    puts 'Whats the ingredient you would like to search for?'
    gets.chomp
  end

  def ask_for_index(context)
    puts "Which recipe do you want to " + context
    gets.chomp.to_i
  end

end
