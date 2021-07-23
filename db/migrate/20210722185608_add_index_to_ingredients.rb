class AddIndexToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_index :ingredients, :recipe_id
  end
end
