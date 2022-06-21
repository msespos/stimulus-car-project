class CarsController < ApplicationController
  def index
  end

  def edit
    @car = Car.find(params[:car_id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      render "new"
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  private

    def car_params
      params.require(:car).permit(:name, variants_attributes: [:id, :color, :seats, :tape])
    end
end
