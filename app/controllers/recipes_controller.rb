class RecipesController < ApplicationController
    before_action :authenticate_request,except:[:index]
    def index
        recipes=Recipe.all
        #render json: recipes, status: :ok
        recipes=recipes.take(9)
        render json: RecipeBlueprint.render(recipes,view: :normal)
    end
    def create
        
        user=@current_user
        recipe=Recipe.new(recipe_params)
        recipe.user=user
        if recipe.save
            render json: recipe, status: :created 
        else
            render json: recipe.errors, status: :unprocessable_entity
        end
    end
    def show
        recipe=Recipe.find(params[:id])
        render json: RecipeBlueprint.render(recipe,view: :normal)
    end
    def update
        recipe=Recipe.find(params[:id])
        if recipe.user_id && recipe.user_id==@current_user 
            recipe.update(recipe_params)
        else
            render json: {error:'not the author of the recipe'}, status: :unauthorized
        end
    end
    def destroy
        recipe=Recipe.find(params[:id])
        if recipe.user_id==@current_user.id
            recipe.destroy
            recipes=Recipe.all
            recipes=recipes.take(9)
        render json: RecipeBlueprint.render(recipes,view: :normal)
        else
            render json: {error:'not the author of the recipe'}, status: :unauthorized
        end
    end

    private
    def recipe_params
        params.permit(:title,:body,:category)
    end
end
