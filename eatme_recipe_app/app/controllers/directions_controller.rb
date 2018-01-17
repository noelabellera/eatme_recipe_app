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

    def edit
        @direction = Direction.find(params[:id])
    end

    def update
        @direction = Direction.find(params[:id])
        if @direction.update_attributes(direction_params)
            redirect_to recipe_path(@direction.recipe)
        else 
            render :edit
        end
    end 

    def destroy
        @direction = Direction.find(params[:id])
        @direction.destroy
        redirect_to recipe_path(@direction.recipe)
    end


private

    def direction_params
        params.require(:direction).permit(:instruction)
    end
end
