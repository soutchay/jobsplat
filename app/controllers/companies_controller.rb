class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def show
		cb_key = ENV["CB_CLIENT_ID"]
		thiscompany = Company.find(params[:id])
		path = thiscompany.path
		@company_info = HTTParty.get("http://api.crunchbase.com/v/2/" + path + "?user_key=" + cb_key)
		# raise company_info['data']['properties'].inspect
		# raise @company_info['data']['properties']['short_description']
		if @company_info['data']['relationships']['primary_image']
			image_path = @company_info['data']['relationships']['primary_image']['items'][0]['path']
			@company_image = "http://a2.images.crunchbase.com/" + image_path
		end
		# @company.jobs << Job.new(params.require(:job).permit(:company_id, :title, :description, :is_open, :salary))

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
