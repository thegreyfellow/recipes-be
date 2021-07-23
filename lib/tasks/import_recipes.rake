require 'oj'

namespace :db do
  namespace :seed do
    desc 'Import all reciepes and their ingredients to the Database'
    task recipes_and_ingredients: :environment do
      puts('Loading recipes and ingredients in the DB...')
      start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      recipes_count = 0
      ingredients_count = 0
      File.open('recipes.json', 'r').each_with_index do |line, _index|
        recipe_hash = Oj.load(line)
        recipe = create_recipe(recipe_hash)
        recipes_count += 1
        recipe_hash['ingredients'].each do |name|
          ingredient = create_ingredient(recipe.id, name)
          ingredients_count += 1
        end

        print('.')
      end
      puts("\n")
      end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      puts("created #{recipes_count} of Recipes")
      puts("created #{ingredients_count} of Ingredients")
      puts("and it took #{(end_time - start_time).floor(2)} seconds to do that")
    end

    def create_recipe(recipe_hash)
      Recipe.create(
        name: recipe_hash['name'],
        total_time: recipe_hash['total_time'],
        people_quantity: recipe_hash['people_quantity'],
        difficulty: recipe_hash['difficulty'],
        image: recipe_hash['image'],
        cook_time: recipe_hash['cook_time'],
        prep_time: recipe_hash['prep_time'],
        budget: recipe_hash['budget'],
        author: recipe_hash['author']
      )
    end

    def create_ingredient(recipe_id, name)
      Ingredient.create(name: name, recipe_id: recipe_id)
    end
  end
end
