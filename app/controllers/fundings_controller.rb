class FundingsController < ApplicationController
  before_action :set_funding, only: [:show, :edit, :update, :destroy]

  def index
    @fundings = Funding.all
  end

  def show
  end

  def new
    @funding = Funding.new
  end

  def edit
  end

  def create
    @funding = Funding.new(funding_params)

    respond_to do |format|
      if @funding.save
        format.html { redirect_to @funding, notice: 'Funding was successfully created.' }
        format.json { render :show, status: :created, location: @funding }
      else
        format.html { render :new }
        format.json { render json: @funding.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @funding.update(funding_params)
        format.html { redirect_to @funding, notice: 'Funding was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding }
      else
        format.html { render :edit }
        format.json { render json: @funding.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @funding.destroy
    respond_to do |format|
      format.html { redirect_to fundings_url, notice: 'Funding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_funding
      @funding = Funding.find(params[:id])
    end
  
    def funding_params
      params.require(:funding).permit(:email, :phone, :account_number, :routing_no, :agreed, :individual_id)
    end
end
