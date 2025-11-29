class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Require users to be signed in by default
  before_action :authenticate_user!

  def profile
    #Fetch the users information
    @user = current_user
  end

  def my_reads
    #Fetches books user has read
    @user = current_user
    @books = @user.books.where(read: true)
  end
end
