class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
  	# catch current_user and make it available everywhere
  	# if user not logged in will say nil, will say user object if logged in
  	# || means memoization, go to database, cache current user
  	# where method always brings back an array of stuff, so .first will pick up first thing
  	@current_user ||= User.where(id: session[:user_id]).first
    # find all users with this session id, if there were multiple we only want the first one
    # else we get back nil
  end
end