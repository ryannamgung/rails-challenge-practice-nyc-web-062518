class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find_by(id: params[:id])
    # @companies = Company.select{|company| company.id == @building.company_id}
    @companies = @building.companies
    # byebug
    #
    # @companies = @building.companies
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to building_path(@building)
    else
      render :new
    end
  end

  def edit
    @building = Building.find_by(id: params[:id])
  end

  def update
    @building = Building.find_by(id: params[:id])
    if @building.update(building_params)
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  def destroy
    @building = Building.find_by(id: params[:id])
    @building.destroy
    redirect_to buildings_path
  end

  private

  def building_params
    params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
  end
end
