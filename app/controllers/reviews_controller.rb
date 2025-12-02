class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
        @book = Book.find(params[:book_id])

        @review = @book.reviews.build(review_params)
        @review.user = current_user

        if @review.save
            redirect_to @book, notice: "Review posted."
        else
            flash.now[:alert] = "Sorry, could not save review."
            render "books/show", status: :unprocessable_entity
        end
    end

    # delete review
    def destroy
        @book = Book.find(params[:book_id])
        @review = @book.reviews.find(params[:id])

        if @review.user == current_user
            @review.destroy
            redirect_to @book, notice: "Review deleted."
        else
      redirect_to @book, alert: "You may only delete your own review."
        end
end


    private

    def review_params
        params.require(:review).permit(:body, :rating)
    end
end
