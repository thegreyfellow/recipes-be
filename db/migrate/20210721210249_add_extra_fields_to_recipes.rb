class AddExtraFieldsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :image, :string, null: true
    add_column :recipes, :cook_time, :string, null: true
    add_column :recipes, :prep_time, :string, null: true
    add_column :recipes, :budget, :string, null: true
    add_column :recipes, :author, :string, null: true
  end
end
