class ApplicationController < ActionController::Base
  protect_from_forgery


	def login_user_filter
			unless session[:user_id]
					redirect_to(:controller => "user", :action => "login_page")
					return false
			else
					return true
			end
	end


end
