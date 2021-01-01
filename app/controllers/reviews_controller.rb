class ReviewsController < ApplicationController


    

    def new
        @review = current_user.reviews.build
    end

    def create
        review = current_user.reviews.build(review_params)
        if review.valid?
            review.save
            redirect_to review.recipe
        else
            redirect_to root_path
        end

    end

    def show
    end

    private

    def review_params
        params.require(:review).permit(:recipe_id, :user_id, :heading, :description )
    end 


end
