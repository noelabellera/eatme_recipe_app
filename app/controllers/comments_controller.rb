class CommentsController < ApplicationController

    def new
    end

    def create 
        @recipe = Recipe.find(params[:recipe_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user


        @recipe.comments.push(@comment)
        redirect_to recipe_path(@recipe)
    end

    def show
        @comment = Comment.post(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update_attributes(comment_params)
            redirect_to recipe_path(@comment.recipe)
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to recipe_path(@comment.recipe)
    end
private

    def comment_params
        params.require(:comment).permit(:post)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
end