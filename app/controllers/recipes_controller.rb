class RecipesController < ApplicationController

    before_action :authenticate_user!

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
        session
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

    def show 
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions)
    end

end
