class UsersController < ApplicationController
	def index
		@users = User.all
		@companies = Company.all
#		@jobs = Job.all
	end
	def show
		@user = User.find(param[:id])
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params.require(:user).permit(:username, :password, :email, :location))
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end
end
