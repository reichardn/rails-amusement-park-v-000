class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user
    failed_ride = @ride.take_ride 
    
    if failed_ride
      flash[:alert] = failed_ride 
    else
      flash[:alert] = "Thanks for riding the #{@ride.attraction.name}!"
    end

    redirect_to user_path(current_user)
  end

  private 

  def ride_params
    params.require(:ride).permit(:attraction_id)
  end

end
