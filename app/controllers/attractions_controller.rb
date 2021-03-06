class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path
    else
      render :edit
    end
  end

private
  def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
