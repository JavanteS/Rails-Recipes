class RecipesController < ApplicationController
    before_action :authenticate_user!


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
        #binding.pry
        if @recipe.valid?
            @recipe.save
            redirect_to @recipe
        else
            redirect_to new_recipe_path
        end 
    end

    def show
        if params[:category_id]
            #binding.pry
            @recipes = current_user.categories.find(params[:category_id]).recipes
            @recipe = @recipes.find_by(id: params[:id])
            if @recipe.nil?
                redirect_to category_recipes_path, alert: "recipe not found"
            end
            #@recipe = @category.recipes.find_by(id: params[:id])
        else
            @recipe = current_user.recipes.find_by(id: params[:id])
        end
    end

    def filter_time
        @recipes = current_user.recipes
        render :filter_time
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
        @recipe = current_user.recipes.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :cooking_time, :category_id, :user_id, category_attributes: [:name])
    end

end
