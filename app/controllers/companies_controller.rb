class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end
	def show
		@company = Company.find(params[:id])		
	end
	def new
		@company = Company.new
	end
	def create
		@company = Company.new(params.require(:company).permit(:name, :about, :positions, :address))
		if @company.save
			redirect_to companies_path
		else
			render 'new'
		end
	end

end
