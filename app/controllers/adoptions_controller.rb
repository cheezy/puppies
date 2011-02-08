class AdoptionsController < ApplicationController
  skip_before_filter :authorize
  
  # GET /adoptions
  # GET /adoptions.xml
  def index
    @adoptions = Adoption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adoptions }
    end
  end

  # GET /adoptions/1
  # GET /adoptions/1.xml
  def show
    @adoption = Adoption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adoption }
    end
  end

  # GET /adoptions/new
  # GET /adoptions/new.xml
  def new
    @adoption = Adoption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adoption }
    end
  end

  # GET /adoptions/1/edit
  def edit
    @adoption = Adoption.find(params[:id])
  end

  # POST /adoptions
  # POST /adoptions.xml
  def create
    @cart = current_cart
    puppy = Puppy.find(params[:puppy_id])
    @adoption = @cart.add_puppy(puppy.id)

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to(@adoption.cart) }
        format.xml  { render :xml => @adoption, :status => :created, :location => @adoption }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adoption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adoptions/1
  # PUT /adoptions/1.xml
  def update
    @adoption = Adoption.find(params[:id])

    respond_to do |format|
      if @adoption.update_attributes(params[:adoption])
        format.html { redirect_to(@adoption, :notice => 'Adoption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adoption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.xml
  def destroy
    @adoption = Adoption.find(params[:id])
    @adoption.destroy

    respond_to do |format|
      format.html { redirect_to(adoptions_url) }
      format.xml  { head :ok }
    end
  end
end
