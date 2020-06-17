class RecipesController < ApplicationController

    before_action :require_login

    def index
        @recipes = Recipe.all
        
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            redirect_to :new
        end 
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :category_id, :user_id)
    end

end
