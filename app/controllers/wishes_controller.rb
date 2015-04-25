class WishesController < ApplicationController

  skip_before_action :check_user_signing, only: :index

  def index
  	@wishes = MyWish.all
  end

  def new
  	@wish = MyWish.new
  end
end
