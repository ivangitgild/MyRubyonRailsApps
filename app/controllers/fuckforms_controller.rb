class FuckformsController < ApplicationController
  # GET /fuckforms
  # GET /fuckforms.json
  def index
    @fuckforms = Fuckform.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fuckforms }
    end
  end

  # GET /fuckforms/1
  # GET /fuckforms/1.json
  def show
    @fuckform = Fuckform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fuckform }
    end
  end

  # GET /fuckforms/new
  # GET /fuckforms/new.json
  def new
    @fuckform = Fuckform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fuckform }
    end
  end

  # GET /fuckforms/1/edit
  def edit
    @fuckform = Fuckform.find(params[:id])
  end

  # POST /fuckforms
  # POST /fuckforms.json
  def create
    @fuckform = Fuckform.new(params[:fuckform])

    respond_to do |format|
      if @fuckform.save
        format.html { redirect_to @fuckform, notice: 'Fuckform was successfully created.' }
        format.json { render json: @fuckform, status: :created, location: @fuckform }
      else
        format.html { render action: "new" }
        format.json { render json: @fuckform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fuckforms/1
  # PUT /fuckforms/1.json
  def update
    @fuckform = Fuckform.find(params[:id])

    respond_to do |format|
      if @fuckform.update_attributes(params[:fuckform])
        format.html { redirect_to @fuckform, notice: 'Fuckform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fuckform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuckforms/1
  # DELETE /fuckforms/1.json
  def destroy
    @fuckform = Fuckform.find(params[:id])
    @fuckform.destroy

    respond_to do |format|
      format.html { redirect_to fuckforms_url }
      format.json { head :no_content }
    end
  end
end
