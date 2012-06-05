class ApplicationController < ActionController::Base
  before_filter :login_required
  protect_from_forgery
  #before_filter :set_user
 
  protected
    def set_user
     if session[:user_id].nil?
		redirect_to adminusers_path + '/login'
	 end
	  #if @user.nil? && session[:id]
		 #$@user = Adminuser.find(session[:id]) 
    end

    def login_required
     # return true if @user
	  if !session[:user_id]
        access_denied
	  end
     # return false
    end

    def access_denied
     # session[:return_to] = request.request_uri
      flash[:error] = 'Oops. You need to login before you can view that page.' 
      redirect_to :controller => 'adminusers', :action => 'login'
    end
  


end
