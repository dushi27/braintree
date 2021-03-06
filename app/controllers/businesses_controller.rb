class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all
  end

  def show
  end
  
  def new
    raise params.inspect
    @individual = Individual.find(params[:format])
    @business = Business.new
  end

  def edit
  end

  def create
    @business = Business.new(business_params)
    @business.individual_id = @individual.id
    @business.save
    
    respond_to do |format|
      if @business.save
        format.html { redirect_to new_funding_path, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:leagal_name, :dba_name, :tax_id, :street_address, :city, :state, :zip, :individual_id)
    end
end
