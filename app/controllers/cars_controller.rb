class CarsController < ApplicationController
  def edit
    @car = Car.find(params[:car_id])
  end

  def update
    params["car"] ||= { variants_attributes: [] }
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      flash[:alert] = "DIDN'T UPDATE"
      render "show"
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  private

    def car_params
      params.require(:car).permit(:name, variants_attributes: [:color, :seats, :tape])
    end
end
