class UsersController < ApplicationController
	skip_before_filter :authorize, :only => :index
	def index
		# data = crunchbase['data']
		# @item = data['item']
		# # organization = item[:name].first

		# cb_key = ENV["CB_CLIENT_ID"]
		# @users = User.all
		# @companies = Company.all
		# @info = CompanyInfo.all

		# uri = HTTParty.get("http://api.crunchbase.com/v/2/organizations?user_key="+cb_key)
		# crunchbase = JSON.parse(uri.body)
		# @cbarray = []
		# # @otherarray = []

		# crunchbase['data']['items'].each do |x| 
		# 	@cbarray.push(x)
		# end
	 #    # @cbarray.push(crunchbase['data']['items'].e)
	   
	 #    @cbarray.each do |p|
  #          @company_info  = Company.new(p)
  #          @company_info.save
	 #    end

		# @org = HTTParty.get("http://api.crunchbase.com/v/2/" + ['path'] + "?user_key=d224dae72322c76020abe8f666bdb12e")
		# @cbarray.each do |p|
		# cburi = HTTParty.get("http://api.crunchbase.com/v/2/" + p['path'] + "?user_key=d224dae72322c76020abe8f666bdb12e")
		# end

		# attempt to clear duplicate names
		# for i in 1..@cbarray.length
		# 	if (@cbarray[i]['name'] == @cbarray[i-1]['name'])
		# 		@cbarray.delete_at(i)
		# 	end
		# end

		# @cbarray is the crunchbase organizations information
		# 

	end
	def show
		# @user = User.find(params[:id])
		# cb_key = ENV["CB_CLIENT_ID"]
		# @users = User.all
		# @companies = Company.all
		# @info = CompanyInfo.all
		# @jobs = Job.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(params.require(:user).permit(:username, :password, :password_confirmation, :email, :location))
		
		if @user.save
			# when someone makes a user, it will automatically log them in, @user references to @user under this method
			session[:user_id] = @user.id.to_s
			redirect_to user_path(@user)
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
