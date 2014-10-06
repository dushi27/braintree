class IndividualsController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  def index
    @individuals = Individual.all
  end

  def show
  end

  def new
    @individual = Individual.new
  end

  def edit
  end

  def create
    @individual = Individual.new(individual_params)

    respond_to do |format|
      if @individual.save
        format.html { redirect_to new_business_path(params[:id => @individual.id])}
        format.json { render :show, status: :created, location: @individual }
      else
        format.html { render :new }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @individual.update(individual_params)
        format.html { redirect_to @individual, notice: 'Individual was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @individual.destroy
    respond_to do |format|
      format.html { redirect_to individuals_url, notice: 'Individual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_individual
      @individual = Individual.find(params[:id])
    end

    def individual_params
      params.require(:individual).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :ssn, :street_address, :city, :state, :zip)
    end  
end
