class SessionsController < ApplicationController
	def new
		# Present an empty login form
		@user = User.new
		@is_login = true
	end

	def create
		 # raise params.inspect
		# Find the user that is trying to log in, looking at something by user which has username nested under username from model/class, can add ', email: params[:user][:email]' to make it also require email as a params		
		u = User.where(username: params[:user][:username]).first
		if u && u.authenticate(params[:user][:password])
			# Store as a cookie in the users' browser the ID of them,
			# indicating that they are logged in
			# translating to a string, sticks it to browser
			session[:user_id] = u.id.to_s
			redirect_to user_path(u)
		else
			# Go back to the login page
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to index_path
	end
end