class CartsController < ApplicationController
  skip_before_filter :authorize, :only => [:show, :create, :update, :destroy]
  
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to agency_url, :notice => 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
      end
    end
  end

  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to(@cart, :notice => 'Cart was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to(@cart, :notice => 'Cart was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    
     respond_to do |format|
      format.html { redirect_to(agency_url, :notice => 'Your cart is currently empty') }
    end
  end
end
