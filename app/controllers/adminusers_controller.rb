class AdminusersController < ApplicationController
	
	#before_filter :login_required
	skip_before_filter :login_required
  def login
	
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
        redirect_to adminusers_path + '/login'
      end
    else
      flash[:notice] = "Sorry, no user was found with that username/password combination."
    end
	
   end
   
    
  end
    # GET /adminusers
  # GET /adminusers.json
  def index
    @adminusers = Adminuser.all
	@users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adminusers }
    end
  end

  # GET /adminusers/1
  # GET /adminusers/1.json
  def show
    @adminuser = Adminuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adminuser }
    end
  end

  # GET /adminusers/new
  # GET /adminusers/new.json
  def new
    @adminuser = Adminuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adminuser }
    end
  end

  # GET /adminusers/1/edit
  def edit
    @adminuser = Adminuser.find(params[:id])
  end

  # POST /adminusers
  # POST /adminusers.json
  def create
    @adminuser = Adminuser.new(params[:adminuser])

    respond_to do |format|
      if @adminuser.save
        format.html { redirect_to @adminuser, notice: 'Adminuser was successfully created.' }
        format.json { render json: @adminuser, status: :created, location: @adminuser }
      else
        format.html { render action: "new" }
        format.json { render json: @adminuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adminusers/1
  # PUT /adminusers/1.json
  def update
    @adminuser = Adminuser.find(params[:id])

    respond_to do |format|
      if @adminuser.update_attributes(params[:adminuser])
        format.html { redirect_to @adminuser, notice: 'Adminuser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adminuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminusers/1
  # DELETE /adminusers/1.json
  def destroy
    @adminuser = Adminuser.find(params[:id])
    @adminuser.destroy

    respond_to do |format|
      format.html { redirect_to adminusers_url }
      format.json { head :no_content }
    end
  end
end
