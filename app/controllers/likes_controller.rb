class LikesController < ApplicationController
    
    def create
        current_user.likes.create(recipe_id: params[:recipe_id])
        redirect_to recipe_path(params[:recipe_id])
    end

    def destroy
        @like = Like.find_by(user: current_user, recipe_id: params[:id])
        @like.destroy
        redirect_to recipe_path(params[:id])
    end 

end