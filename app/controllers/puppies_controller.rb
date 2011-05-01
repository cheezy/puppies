class PuppiesController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    @puppies = Puppy.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @puppy = Puppy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @puppy = Puppy.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @puppy = Puppy.find(params[:id])
  end

  def create
    @puppy = Puppy.new(params[:puppy])

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to(@puppy, :notice => 'Puppy was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @puppy = Puppy.find(params[:id])

    respond_to do |format|
      if @puppy.update_attributes(params[:puppy])
        format.html { redirect_to(@puppy, :notice => 'Puppy was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @puppy = Puppy.find(params[:id])
    @puppy.destroy

    respond_to do |format|
      format.html { redirect_to(puppies_url) }
    end
  end
end
