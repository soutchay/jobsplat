class UsersController < ApplicationController
	def index
		@users = User.all
		@companies = Company.all
#		@jobs = Job.all
	end
	def show
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params.require(:user).permit(:username, :password, :password_confirmation, :email, :location))
		if @user.save
			# when someone makes a user, it will automatically log them in
			session[:user_id] = @user.id.to_s
			redirect_to users_path
		else
			render 'new'
		end
	end
end
