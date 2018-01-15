class RecipesController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action :set_house, only: [:show, :edit, :update, :destroy]


    def index 
        @recipes = Recipe.all
    end


    def show  
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
        @user = User.new
    end

    def edit 
        @recipe = Recipe.find(params[:id])
    end
    
    def create 
        @recipe = Recipe.new(recipe_params)
        
        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end

    def destroy 
       @recipe = Recipe.find(params[:id])
       @recipe.destroy  
       redirect_to recipes_path
    end
    
    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :time, :yield, :course)
    end
end 