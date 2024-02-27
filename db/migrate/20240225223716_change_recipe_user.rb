class ChangeRecipeUser < ActiveRecord::Migration[7.1]
  def change
    change_column_null :recipes, :user_id, true
  end
end
