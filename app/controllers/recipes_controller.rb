class RecipesController < ApplicationController
    def index
        recipes=Recipe.all
        render json: recipes, status: :ok
    end
    def create
        recipe=Recipe.new(recipe_params)
        if recipe.save
            render json: recipe, status: :created 
        else
            render json: recipe.errors, status: :unprocessable_entity
        end
    end
    def show
        recipe=Recipe.find(params[:id])
        render json: recipe,status: :ok
    end
    def update
        recipe=Recipe.find(params[:id])
        if recipe.user_id && recipe.user_id=@current_user 
            recipe.update(recipe_params)
        else
            render json: {error:'not the author of the recipe'}, status: :unauthorized
        end
    end
    def destroy
        recipe=Recipe.find(params[:id])
        if recipe.user_id && recipe.user_id=@current_user 
            recipe.destroy
        else
            render json: {error:'not the author of the recipe'}, status: :unauthorized
        end
    end

    private
    def recipe_params
        params.permit(:title,:body,:category,:user_id)
    end
end
