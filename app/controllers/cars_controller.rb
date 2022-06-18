class CarsController < ApplicationController
  def index
    #START HERE
  end

  def new
    @car = Car.new
    # THIS NEEDS TO BE REMOVED ONCE VARIANTS ARE DYNAMICALLY ADDED
    3.times { @car.variants.build }
  end

  # THIS MAY BE MOVED TO UPDATE, FOR UPDATING VARIANTS, NOT CARS
  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car
    else
      render "new"
    end
  end

  private

    def car_params
      params.require(:car).permit(:name, variants_attributes: [:color, :seats, :tape])
    end
end
