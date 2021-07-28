# frozen_string_literal: true

recipes_array = []

@recipes.each do |recipe|
  existing_ingredients = recipe.ingredients.where(
    'ingredients.name ILIKE ANY ( array[?] )',
    @ingredients_with_percetage_signs
  )
  missing_ingredients = recipe.ingredients.all.where.not(id: existing_ingredients.pluck(:id))

  recipes_array << {
    existing_ingredients: existing_ingredients,
    missing_ingredients: missing_ingredients,
    merge: recipe.attributes

  }
end

json.data recipes_array do |recipe|
  json.existing_ingredients recipe[:existing_ingredients]
  json.missing_ingredients recipe[:missing_ingredients]
  json.merge! recipe[:merge]
end

json.pagination do
  json.items  @pagination[:items]
  json.next   @pagination[:next]
end
