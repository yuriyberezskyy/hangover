class ReviewsController < ApplicationController

def new
@review = Review.new
end

def create
# byebug
@review = Review.create(strong_params.merge(user_id: session[:user_id]))
redirect_to @review.business
end

private

def strong_params
params.require(:review).permit(:rating, :content, :business_id)
end

end
