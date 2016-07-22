class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'company was successfully created.' }
        format.json { render action: 'show', status: :created, location: company_path(@company) }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'company was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: company_path(@company) }
      else
        format.html { render action: 'edit' }
        format.json { render json: company.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_company
      @company = Company.find(params[:id])
    end

  def company_params
    params.require(:company).permit(:name, :lat, :lng, :address, :city, :postcode)
  end
end
