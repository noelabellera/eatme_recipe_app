class LikesController < ApplicationController
    def create 
        current_user.recipes << Recipe.find(params[:recipe_id])
        @recipe = Recipe.find(params[:recipe_id])
        redirect_to recipe_path(params[:recipe_id])
    end 

    def destroy
        @recipe = current_user.recipes.find(params[:id])
        current_user.recipes.delete(@recipe)
        redirect_to recipe_path(params[:id])
    end 

end