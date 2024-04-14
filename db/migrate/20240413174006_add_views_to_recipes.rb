class AddViewsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :views, :integer
  end
end
