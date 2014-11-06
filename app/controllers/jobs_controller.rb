class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end
	def new
		@job = Job.new
		@company = params[:id]
	end
	def create
        
		@company = Company.find(params[:id])
		@company.jobs << Job.new(params.require(:job).permit(:company_id, :title, :description, :is_open, :salary))
		
		if @company.save
			redirect_to company_path
		else
			render 'new'
		end
	end
	def show
		# @company = Company.find(params[:id])
		@job = Job.find(params[:job_id])
	end
	def edit
		@one_job = Job.find(params[:job_id])
		# @company = Company.find(params[:id])
       # @job = Job.find(params[:job_id])
	end
	def update
        #rip the params out of the url
     
	@job = Job.find(params[:job_id])
	@job.title = params[:title]
    @job.save
    redirect_to job_path(params[:job_id])
   # @job.update(params.require(:job).permit(:title, :description, :salary, :is_open))


		
	end
end
