class RecipesController < ApplicationController

    before_action :authenticate_user!


    def index
        binding.pry
        @recipes = current_user.recipes
    end

    def new
        @recipe = Recipe.new(category_id: params[:category_id])
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            redirect_to new_recipe_path
        end 
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def edit
        @recipe = Recipe.find(params[:id])  
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :category_id, :user_id)
    end

end
