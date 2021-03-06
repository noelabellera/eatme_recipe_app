class IngredientsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

    def new
    end

    def create
        @recipe = Recipe.find(params[:recipe_id])
        @ingredient = @recipe.ingredients.create(ingredient_params)
        redirect_to recipe_path(@recipe)
    end

    def show
        @ingredient = Ingredient.post(params[:id])
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        if @ingredient.update_attributes(ingredient_params)
            redirect_to recipe_path(@ingredient.recipe)
        else 
            render :edit
        end
    end 

    def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
        redirect_to recipe_path(@ingredient.recipe)
    end
    
private
    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:item)
    end
end