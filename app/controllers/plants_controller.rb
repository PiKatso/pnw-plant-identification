class PlantsController < ApplicationController
  # class variables
  @@leaves = nil
  @@cones = nil
  @@bark = nil
  @@branches = nil

  def index
    # # creates an anonymous scope
    @plants = Plant.where(nil)

    @plants = @plants.search_all(@@leaves, @@cones, @@bark, params[:branches]) if params.values_at( :branches).all?(&:present?)
    
    @@leaves = params[:leaves] if params[:leaves].present?
    @@cones = params[:cones] if params[:cones].present?
    @@bark = params[:bark] if params[:bark].present?
    @@branches = params[:branches] if params[:branches].present?

    # single search params SCOPES
    # @plants = @plants.s_b_leaves(params[:leaves]) if params[:leaves].present?
    # @plants = @plants.s_b_cones(params[:cones]) if params[:cones].present?
    # @plants = @plants.s_b_bark(params[:bark]) if params[:bark].present?
    # @plants = @plants.s_b_branches(params[:branches]) if params[:branches].present?

    # name scope
    @plants = @plants.s_b_name(params[:name]) if params[:name].present?
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      flash[:notice] = "Plant successfully added"
      redirect_to Plants_path
    else
      render :new
      flash[:notice] = "Plant creation failed"
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      flash[:notice] = "Plant successfully updated"
      redirect_to plant_path(@plant)
    else
      flash[:notice] = "Plant update failed"
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    if @plant.destroy
      flash[:notice] = "Plant successfully removed"
      redirect_to Plants_path
    end
  end

private

  def plant_params
    params.require(:plant).permit(:name, :scientific_name, :plant_type, :general, :ecology, :leaves, :cones, :bark, :branches)
  end

  def scope_params(params)
     params.slice(:name, :bark, :cones, :branches, :leaves)
  end

end
