class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:create, :edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  layout "application"

  def book_club
    # Fetch all reviews, newest first
    @reviews = Review.includes(:user, :book).order(created_at: :desc)
  end

  # Method to create a review
  def create
    @review = @book.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @book, notice: "Review posted."
    else
      Rails.logger.debug "Review errors: #{@review.errors.full_messages}"
      flash.now[:alert] = "Sorry, could not save review."
      render "books/show", status: :unprocessable_entity
    end
  end

  def edit

  end

  # Updating review after edit
  def update
    if @review.update(review_params)
      redirect_to @book, notice: "Review updated."
    else
      flash.now[:alert] = "Could not update review."
      render :edit, status: :unprocessable_entity
    end
  end


  # Delete a review
  def destroy
    @review.destroy
    redirect_to @book, notice: "Review deleted."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
  def set_review
    @review = @book.reviews.find(params[:id])
  end
  def authorize_user!
    unless @review.user == current_user
      redirect_to @book, alert: "You may only edit or delete your own review."
    end
  end

  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
