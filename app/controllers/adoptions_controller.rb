class AdoptionsController < ApplicationController
  skip_before_filter :authorize
  
  # GET /adoptions
  def index
    @adoptions = Adoption.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /adoptions/1
  def show
    @adoption = Adoption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /adoptions/1/edit
  def edit
    @adoption = Adoption.find(params[:id])
  end

  # POST /adoptions
  def create
    @cart = current_cart
    puppy = Puppy.find(params[:puppy_id])
    @adoption = @cart.add_puppy(puppy.id)

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to(@adoption.cart) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /adoptions/1
  def update
    @adoption = Adoption.find(params[:id])

    respond_to do |format|
      if @adoption.update_attributes(params[:adoption])
        format.html { redirect_to(@adoption, :notice => 'Adoption was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /adoptions/1
  def destroy
    @adoption = Adoption.find(params[:id])
    @adoption.destroy

    respond_to do |format|
      format.html { redirect_to(adoptions_url) }
    end
  end
end
