class RecipesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_recipe, only: [:edit, :update, :destroy]


    def index
        if params[:category_id]
            @category = current_user.categories.find_by(id: params[:category_id])
            if @category.nil?
                redirect_to categories_path
            else
                @recipes = @category.recipes
            end
        else
            @recipes = current_user.recipes
        end
    end

    def new
        if params[:category_id]
            @category = current_user.categories.find_by(id: params[:category_id])
            if @category    
                @recipe = @category.recipes.build
            else
                redirect_to new_recipe_path, alert: "recipe not found"
            end
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
            render :new
        end 
    end

    def show
        if params[:category_id]
            @recipes = current_user.categories.find(params[:category_id]).recipes
            @recipe = @recipes.find_by(id: params[:id])
            if @recipe.nil?
                redirect_to category_recipes_path, alert: "recipe not found"
            end
            
        else
            @recipe = current_user.recipes.find_by(id: params[:id])
        end
    end

    def filter_time
        @recipes = current_user.recipes.ordered_by_title
    end

    def edit
         if !@recipe
            redirect_to new_recipe_path, alert: "Recipe not found. Create a new one here."
         end 
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render :edit
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :cooking_time, :category_id, :user_id, category_attributes: [:name])
    end

    def set_recipe
        @recipe = current_user.recipes.find_by(id: params[:id])
    end
end
