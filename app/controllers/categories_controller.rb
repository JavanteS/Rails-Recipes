class CategoriesController < ApplicationController


    def index
        @categories = current_user.categories
    end

    def new
    end

    def create
    end

    def show
        @category = Category.find(params[:id])
    end

    def edit
    end

    def update
    end


end
