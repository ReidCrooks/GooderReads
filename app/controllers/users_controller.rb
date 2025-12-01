class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def my_reads
    @user = current_user
    @books = current_user.books # Get books for logged in user
  end
end
