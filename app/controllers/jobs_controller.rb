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
		
		@job = Job.find(params[:job_id])
		
		# @company = Company.find(params[:id])
       # @job = Job.find(params[:job_id])
	end
	def update
        #rip the params out of the url
         # raise "update"
		@job = Job.find(params[:job_id])
		
		@job.title = params[:job][:title]
		@job.description = params[:job][:description]
		@job.salary = params[:job][:salary]
		@job.is_open = params[:job][:is_open]
		@job.save
	    
	    redirect_to job_path(:job_id => params[:job_id])
   # @job.update(params.require(:job).permit(:title, :description, :salary, :is_open))
	end

	def destroy
		@job = Job.find(params[:job_id])
		@job.destroy
		redirect_to company_path
	end
end
