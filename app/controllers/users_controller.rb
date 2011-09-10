class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :new, :create]

  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url,
                                  :notice => "User #{@user.name} was successfully created.") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url,
                                  :notice => "User #{@user.name} was successfully updated.") }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end
end
