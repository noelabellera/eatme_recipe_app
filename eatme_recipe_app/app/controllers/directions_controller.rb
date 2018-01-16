class DirectionsController < ApplicationController
    def new
    end

    def create 
        @recipe = Recipe.find(params[:recipe_id])
        @direction = @recipe.directions.create(direction_params)
        redirect_to recipe_path(@recipe)

    end

    def show
        @direction = Direction.post(params[:id])
    end

private

    def direction_params
        params.require(:direction).permit(:instruction)
    end
end
