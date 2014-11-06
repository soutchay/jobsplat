class UsersController < ApplicationController
	def index
		@users = User.all
		@companies = Company.all
#		@jobs = Job.all
		uri = HTTParty.get"http://api.crunchbase.com/v/2/organizations?user_key=d224dae72322c76020abe8f666bdb12e"
		@crunchbase = JSON.parse(uri.body)
		@cbarray = []
		# @crunchbase['data']['items'].each do |x|
	 # 		@cbarray << x['name']
	 # 	for i in 0 .. @cbarray.length
	 # 		if @cbarray[i] === @cbarray[i+1]
	 # 			@cbarray[i].pop
	 # 		end
		# end
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
			# when someone makes a user, it will automatically log them in, @user references to @user under this method
			session[:user_id] = @user.id.to_s
			redirect_to users_path
		else
			render 'new'
		end
	end
	def edit
		@user = User.where(id:params[:id]).first
	end
	def update
		u = User.where(id:params[:id]).first
		if u.update(user_params)
			redirect_to index_path
		else
			redirect to new_user_path
		end
	end

private
	def user_params
		params.require.user(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
