class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :total_time
      t.string :people_quantity
      t.string :difficulty

      t.timestamps
    end
  end
end
