class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end
	def new
		@job = Job.new
		@company = params[:id]
	end
	def create
		@job = Job.new(params.require(:job).permit(:company_id, :title, :description, :is_open, :salary))
		if @job.save
			redirect_to company_path(@job.company)
		else
			render 'new'
		end
	end
	def show
	end
end
