class CategoriesController < ApplicationController


    def index
        @categories = current_user.categories
    end

    def show
        @category = current_user.categories.find_by(params[:id])
    end

end
