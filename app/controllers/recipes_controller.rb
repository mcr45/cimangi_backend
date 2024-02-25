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
    def destroy

    end

    private
    def recipe_params
        params.permit(:title,:body,:category,:user_id)
    end
end
