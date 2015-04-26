class MyWishesController < ApplicationController

  skip_before_action :check_user_signing, only: :index

  def index
  	@wishes = MyWish.all
  end

  def new
  	@wish = MyWish.new
  end

  def create
  	binding.pry
  	MyWish.create(params[:my_wish])
  	redirect_to root_path, notice: 'Wish created successfully.'
  end
end
