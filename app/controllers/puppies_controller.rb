class PuppiesController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show]
  
  # GET /puppies
  # GET /puppies.xml
  def index
    @puppies = Puppy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @puppies }
    end
  end

  # GET /puppies/1
  # GET /puppies/1.xml
  def show
    @puppy = Puppy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @puppy }
    end
  end

  # GET /puppies/new
  # GET /puppies/new.xml
  def new
    @puppy = Puppy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @puppy }
    end
  end

  # GET /puppies/1/edit
  def edit
    @puppy = Puppy.find(params[:id])
  end

  # POST /puppies
  # POST /puppies.xml
  def create
    @puppy = Puppy.new(params[:puppy])

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to(@puppy, :notice => 'Puppy was successfully created.') }
        format.xml  { render :xml => @puppy, :status => :created, :location => @puppy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @puppy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /puppies/1
  # PUT /puppies/1.xml
  def update
    @puppy = Puppy.find(params[:id])

    respond_to do |format|
      if @puppy.update_attributes(params[:puppy])
        format.html { redirect_to(@puppy, :notice => 'Puppy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @puppy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /puppies/1
  # DELETE /puppies/1.xml
  def destroy
    @puppy = Puppy.find(params[:id])
    @puppy.destroy

    respond_to do |format|
      format.html { redirect_to(puppies_url) }
      format.xml  { head :ok }
    end
  end
end
