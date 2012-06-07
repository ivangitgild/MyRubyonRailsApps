class LoginController < ApplicationController
	skip_before_filter :login_required
	def index
		puts session[:user_id]
	  if session[:user_id]
		flash.now[:alert] = "You are already login"
		redirect_to adminusers_path
	 end
	  if request.post? and params[:username]
		@user = Adminuser.new(params[:adminuser])
		user = Adminuser.find_by_username(params[:username])
		# If we found a user with that username and the password provided matches
		# the password on file for that user, we can login the user.
		if user and user.password_matches?(params[:password])
		  session[:user_id] = user.id
		  #user.last_login = Time.now
		  #user.save
	 
		  if user.id?
			redirect_to adminusers_path
		  else
			redirect_to login_path
		  end
		else
		  flash[:notice] = "Sorry, no user was found with that username/password combination."
		end
		
	  end
	end
	
	def logout
		session[:user_id] = nil
		redirect_to root_url
	end
end
