class AttractionsController < ApplicationController

  before_action :set_attraction!, except: [:create, :index, :new]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else 
      redirect_to new_attraction_path
    end
  end

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def show
  end

  private 

  def set_attraction!
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end

