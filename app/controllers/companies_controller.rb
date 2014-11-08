class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def show
		cb_key = ENV["CB_CLIENT_ID"]
		thiscompany = Company.find(params[:id])
		path = thiscompany.path
		HTTParty.get("http://api.crunchbase.com/v/2/" + path + cb_key)
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
