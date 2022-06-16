class CarsController < ApplicationController
  def new
    @car = Car.new
    3.times { @car.variants.build }
  end

  def create
    @car = Car.new(car_params)
    Rails.logger.debug "CAR PARAMS = #{car_params}"
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
