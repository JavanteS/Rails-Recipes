class RecipesController < ApplicationController
    before_action :authenticate_user!


    def index
        if params[:category_id]
            @recipes = Category.find(params[:category_id]).recipes
        else
            @recipes = current_user.recipes
        end

        
    end

    def new
        #check for :category_id in params if yes
        #look up hidden field tag
        if params[:category_id]
            @category = current_user.categories.find_by(id: params[:category_id])
            @recipe = @category.recipes.build
        else  
            @recipe = current_user.recipes.build
        end
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)

        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            redirect_to new_recipe_path
        end 
    end

    def show
        @recipe = current_user.recipes.find(params[:id])
    end

    def edit
        @recipe = current_user.recipes.find(params[:id])  
    end

    def update
        @recipe = current_user.recipes.find(params[:id])
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
        params.require(:recipe).permit(:title, :instructions, :category_id, :user_id, category_attributes: [:name])
    end

end
