class CategoriesController < ApplicationController


    def index
        @categories = current_user.categories
    end

    def new
    end

    def create
    end

    def show
        @category = current_user.categories.find_by(params[:id])
    end

    def edit
    end

    def update
    end


end
