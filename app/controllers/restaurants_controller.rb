class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # it renders the validation errors if there are any.
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # respond with the 422 HTTP code.
      # https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses
      render 'new', status: :unprocessable_entity
    end
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number)
  end
end
