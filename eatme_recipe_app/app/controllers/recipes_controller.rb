class RecipesController < ApplicationController
    before_action :authorize, except: [:index, :show]
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]


    def index 
        @recipes = Recipe.all
    end


    def show  
        @recipe = Recipe.find(params[:id])
        @comment = Comment.new
    end

    def new
        @recipe = Recipe.new
        
       
    end

    def edit 
        @recipe = Recipe.find(params[:id])
    end

    def update 
        @recipe = Recipe.find(params[:id])
        if @recipe.update_attributes(recipe_params)
            redirect_to recipe_path(@recipe)
        else 
            render :edit
        end
    end
    
    def create 
        @user = User.find(session[:user_id])
        @recipe = @user.recipes.new(recipe_params)
        
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end

    def destroy 
        @user = User.find(session[:user_id])
        @recipe = Recipe.find(params[:id])
        @recipe.destroy  
       redirect_to recipes_path
    end

    def my_recipes
        @recipes = current_user.recipes
    end

    
    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :time, :yield, :course)
    end
end 
